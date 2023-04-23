#!/usr/bin/perl

use utf8;
use strict;
use warnings;

use Carp 'croak';
use File::Fetch;
use Term::ANSIColor qw(:constants);
use threads;
use Thread::Queue;

$File::Fetch::BLACKLIST = [qw(lwp netftp httplite httptiny lynx ncftp rsync ftp fetch)];

use constant FILELIST        => 'FILELIST.TXT';
use constant AVAILABLE_HOSTS => [
    'http://ftp.osuosl.org/pub/slackware/slackware64-current/', # ORIGINAL
    'https://mirror.yandex.ru/slackware/slackware64-current/',  # YANDEX MIRROR
    'http://slackware.falseking.org/slackware/slackware64-current/' # ALTERNATE RUSSIAN MIRROR
];
use constant HOST => AVAILABLE_HOSTS->[0]; # DEFAULT HOST

my $thq = Thread::Queue->new();

my $packages     = {};          # Getted packages from remote host
my $sys_packages = {};          # Already installed packages

# Parse system packages info
opendir(my $dh, '/var/log/packages/');
my $installed_packages = [grep {-f "/var/log/packages/$_"} readdir($dh)];
closedir($dh);

for my $p (@$installed_packages) {
    my $data = get_pkg_info($p);
    $sys_packages->{$data->{title}} = {
        version => $data->{version},
        build   => $data->{build}
    };
}

print "Getting remote packages info...\n";

# Get remote filelist
my $filelist;
_get(HOST.'FILELIST.TXT', \$filelist);

# Parse filelist
for (grep {$_ =~ /slackware64\/.+\/.+\.txz$/mx} split /\n/x, $filelist) {
    if ($_ =~ /slackware64\/(.+)\/(.+\.txz)$/mx) {
        my $data = get_pkg_info($2);
        $packages->{$data->{title}} = {
            name    => $2,
            url     => HOST."slackware64/$1/$2",
            version => $data->{version},
            build   => $data->{build}
        };
    }
}

print "Reading system packages info...\n";

for (keys %$sys_packages) {
    my $sys_pkg = $sys_packages->{$_};
    
    if (my $pkg = $packages->{$_}) {
        if ($pkg->{version} ne $sys_pkg->{version} || $pkg->{build} ne $sys_pkg->{build}) {
            $thq->enqueue($pkg);
        }
    }
}
$thq->end();

my @threads = map {threads->create(\&_worker)} 1..10;
$_->join() for (@threads);

sub _worker {
    while (defined(my $pkg = $thq->dequeue_nb())) {
        print '[';
        print BOLD, GREEN, 'FETCHING', RESET;
        print ']: ';
        print BOLD, WHITE, "$pkg->{name}...\n", RESET;
        _get($pkg->{url});
    }
    
    return 0;
}

sub get_pkg_info {
    my $pkg = shift;

    my $pkg_split = [split /-/x, $pkg];
    my ($title, $version, $arch, $tag, $build) = ('', '', '', '', '');
     
    if (scalar @$pkg_split == 6) {
        $title = join('-', ($pkg_split->[0], $pkg_split->[1], $pkg_split->[2]));
        $version = $pkg_split->[3];
        $arch = $pkg_split->[4];
        $build = [split /\./x, $pkg_split->[5]];

        if (scalar @$build > 1) {
            $build = [split /_/, $build->[0]];
            $tag = $build->[1];
            $build = $build->[0];
        }
    } elsif (scalar @$pkg_split == 5) {
        $title = join('-', ($pkg_split->[0], $pkg_split->[1]));
        $version = $pkg_split->[2];
        $arch = $pkg_split->[3];
        $build = [split /\./x, $pkg_split->[4]];

        if (scalar @$build > 1) {
            $build = [split /_/, $build->[0]];
            $tag = $build->[1];
            $build = $build->[0];
        }
    } elsif (scalar @$pkg_split == 4) {
        $title = $pkg_split->[0];
        $version = $pkg_split->[1];
        $arch = $pkg_split->[2];
        $build = [split /\./x, $pkg_split->[3]];

        if (scalar @$build > 1) {
            $build = [split /_/, $build->[0]];
            $tag = $build->[1];
            $build = $build->[0];
        }
    } elsif (scalar @$pkg_split == 6) {
        if ($pkg_split->[3] =~ /\d/x) {
            $title = join('-', ($pkg_split->[0], $pkg_split->[1], $pkg_split->[2]));
            $version = $pkg_split->[3];
        } else {
            $title = join('-', ($pkg_split->[0], $pkg_split->[1], $pkg_split->[2], $pkg_split->[3]));
            $version = '';
        }

        $arch = $pkg_split->[4];
        $build = [split /\./x, $pkg_split->[5]];

        if (scalar @$build > 1) {
            $build = [split /_/, $build->[0]];
            $tag = $build->[1];
            $build = $build->[0];
        }
    } elsif (scalar @$pkg_split == 7) {
        $title = join('-', ($pkg_split->[0], $pkg_split->[1], $pkg_split->[2], $pkg_split->[3]));
        $version = $pkg_split->[4];
        $arch = $pkg_split->[5];
        $build = [split /\./x, $pkg_split->[6]];

        if (scalar @$build > 1) {
            $build = [split /_/, $build->[0]];
            $tag = $build->[1];
            $build = $build->[0];
        }
    } elsif (scalar @$pkg_split == 8) {
        $title = join('-', ($pkg_split->[0], $pkg_split->[1], $pkg_split->[2], $pkg_split->[3], $pkg_split->[4]));
        $version = $pkg_split->[5];
        $arch = $pkg_split->[6];
        $build = [split /\./x, $pkg_split->[7]];

        if (scalar @$build > 1) {
            $build = [split /_/, $build->[0]];
            $tag = $build->[1];
            $build = $build->[0];
        }
    }

    if (ref $build eq 'ARRAY') {
        $build = [split /_/x, $build->[0]]->[0];
    }

    return +{
        title   => $title,
        version => $version,
        arch    => $arch,
        build   => $build
    };
}

sub _get {
    my ($url, $to) = @_;

    return 0 unless $url;

    $to //= '.';
    
    my $ff = File::Fetch->new(uri => $url);
    $ff->fetch(to => $to);
    
    croak("Fetching error: ".$ff->error) if ($ff->error);

    return 1;
}

exit(0);
