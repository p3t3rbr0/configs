use strict;
use warnings;

use lib `fvwm-perllib dir`;
use FVWM::Module;


my $module = new FVWM::Module(
    Name  => 'ZaebokPogoda',
    Debug => 1,
);

my $str = 'ZaebokPogoda';

# $module->send("SendToModule FooBar ChangeTitle 1 $str") ;


$module->showMessage("FvwmRingMenu starting up");

sub sample_event_handler {
    my ( $mod, $event ) = @_;

    my $message = $event->{ argValues }[3];

    # $mod->showMessage( "Message Received: $message" );

    $mod->send( "Echo 'Message Received: $message'" );
}

$module->addHandler( M_STRING, \&sample_event_handler );

$module->eventLoop;
