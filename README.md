## About this repositiry
This repository is a collection of the author's configuration files for some *nix-desktop programs, such as: cwm, emacs,  tmux, mutt, urxvt and more.

*This is not a silver bullet, but simply way to organize and maintain for unified "look and feel" on different PC's, running on Unix-Like OS.*

The author also hopes that this examples of configuration files will be useful to anyone else.

**The author is not responsible for the relevance, correctness, completeness and quality of the information provided.**

## Depencences

* Basic
  * cwm
  * feh
  * moc
  * tmux
  * mutt
  * lynx
  * urxvt
  * emacs
  * compton
  * redshift
* Optional
  * npm (for using eslint in Emacs)

Make sure that these packages are installed on your system.

For Debian-based distribution:

```shell
$ apt-get install feh cwm moc tmux mutt lynx rxvt-unicode-256color emacs compton redshift
```

For Arch Linux

```shell
$ pacman -Si feh cwm moc tmux mutt lynx rxvt-unicode emacs compton redshift
```

For MacOS

```shell
$ brew install tmux mutt lynx emacs
```

## How to use it

```shell
$ git clone https://github.com/ChaoticEvil/configs.git
$ cp -r configs/. ~/
```

### For using eslint in Emacs

For using eslint with js2-mode in Emacs - install eslint globally:

```shell
$ npm install -g eslint
```

### Py

```shell
$ pip install jedi autopep8 flake8 ipython importmagic yapf isort black mypy
```

### Perl

```shell
$ cpan i Devel::PerlySense Perl::Critic Perl::Tidy Devel::Cover
```

### Fonts

* Anonymous Pro
* Anonymous Pro Minus
* Cascadia
* Iosevka
* FiraCode
* ...


## History

### v0.8.6 [2022-01-01]
* Reaggregated fonts
* Removed font (Droid Sans Mono)
* Upgraded fonts (Anonymous Pro Minus 1.003, Cascadia 2108.26, FiraCode 5.2, Iosevka 10.3.0)

### v0.8.5 [2020-12-27]
* Added yaml-mode
* Added lsp-mode for Scala lang (scala-mode, sbt, metals)
* Fixed: pomidor plugin inclusion
* Fixed: js2-mode plugin inclusion
* Removed: nyan-mode plugin
* Upgraded fonts (Iosevka 3.4.0 -> 3.6.3)

### v0.8.4 [2020-08-09]
* Added `insert-timestamp` function to emacs
* Fixed: README* typo
* Fixed default perl5 paths for emacs flycheck
* Upgraded fonts (Iosevka 2.3.0 -> 3.4.0)

### v0.8.3 [2020-02-06]
* Added nyan-mode for Emacs
* Fixed perly_sense error show (using flymake)

### v0.8.2 [2019-11-08]
* Fixed .perltidyrc
* Fixed .perlcriticrc
* Fixed esling with Emacs
* Fixed Emacs modeline format
* Fixed tmux option 'window-status-current-style'
* Added fonts: (Anonymous Pro Minus, MS Cascadia)
* Added working mutt config for using with multiple gmail accounts
* Remove sr-speedbar from emacs config
* Upgraded sbt 1.2 -> 1.3
* Upgraded fonts (Iosevka 2.2.1 -> 2.3.0)

### v0.8.1 [2019-07-23]
* Added yasnippet for Emacs
* Fixed init.el config (typo)

### v0.8.0 [2019-06-08]
* Rewrited Emacs config (total rewrite)
* Fixed slupgrade.pl
* Fixed .muttrc
* Fixed README.md
* Upgraded sbt 1.0 -> 1.2
* Upgraded fonts (Iosevka 2.0.2 -> 2.2.1)

### v0.7.6 [2018-12-21]
* Fixed .emacs.d
* Fixed .eslintrc
* Fixed README.md (date format)
* Upgraded: fonts (Iosevka to v2.0.2)
* Remove wallpapers
* Remove gattaca - the custom emacs theme

### v0.7.5 [2018-09-10]
* Fixed .perltidyrc (refactoring and add new rules)

### v0.7.4 [2018-09-10]
* Fixed .cwmrc
* Fixed .muttrc
* Upgraded: sbt-ensime
* Upgraded: fonts (Iosevka v2.0.0)

### v0.7.3 [2018-06-23]
* Upgraded: sbt-ensime (from v2.2.0 to v2.6.1)
* Upgraded: fonts (Iosevka v1.14.3, Hack v3.003)
* Removed: integral_orbit.* wallpapers
* Removed: st and dwm config directories

### v0.7.2 [2018-02-17]
* Removed: st config
* Removed: dwm config
* Added: some wallpapers
* Added: cursor icons (neutral)
* Fixed: .tmux.conf (small refactoring)

### v0.7.1 [2018-02-17]
* Upgraded: sbt-ensime (from v2.0.1 to v2.2.0)

### v0.7.0 [2018-02-17]
* Added: new fonts (M+ v0.63, Input 1.2)
* Added: some wallpapers (added to data/media/wallpapers)
* Added: simple Perl script for slackware updating (slupgrade.pl)
* Added: Emacs theme - gattaca-theme (based on original bas16-seti theme)
* Upgraded: fonts (Iosevka v1.14.0, Hack v3.002)
* Fixed: .xinitrc (small refactoring)
* Fixed: .emacs.d (small refactoring)
* Fixed: .Xdefaults (changed color pallete)
* Fixed: .cwmrc (enhance color pallete, fixed key bindings)
* Fixed: .tmux.conf (enhance colors, small fixes in statusbar)

### v0.6.3 [2018-02-10]
* Fixed: .cwmrc (disable rofi)
* Fixed: .mailcap (add default charset - utf8)
* Fixed: .muttrc (multiple small fixes)
* Fixed: .tmux.conf (remove hostname from tabbar)
* Fixed: redshift config (disable geoclue by default)

### v0.6.2 [2017-10-21]
* Fixed: .cwmrc (fixed window groups)
* Fixed: .perltidy (improved rules)
* Fixed: .tmux.conf (fixed infobar and 256 colors mode)
* Fixed: .emacs.d (changed several shortcuts, some fixes in console mode)

### v0.6.1 [2017-08-18]
* Removed: duplicate eslintrc

### v0.6.0 [2017-08-18]
* Added: compton config (.compton.conf)
* Added: supplement script for inc/dec brightness (for cwm)
* Added: supplement script for inc/dec screen color with redshift (for cwm)
* Fixed: .muttrc
* Fixed: .Xdefaults
* Fixed: .perltidyrc
* Fixed: .perlcriticrc
* Fixed: .cwmrc (rewrite all config)
* Fixed: .rtorrent.rc
* Fixed: some refactoring in emacs config (X11 and terminal version)
* Fixed: .xinitrc (now using cwm by default window manager)
* Removed: unused fonts
* Upgraded: fonts (Iosevka v1.13.2, Fira Code v1.204, Fira Mono v3.206, Anonimous-pro, Progmata-pro, Consolas, Iconsolata, Hack v2.020, Go)

### v0.5.6 [2017-07-28]
* Added: .mailcap
* Added: .rtorrent.rc
* Fixed: Multiple fixes (colors and external html viewer) in .muttrc

### v0.5.5 [2017-07-23]
* Fixed: URxvt color and fonts in .Xdefaults

### v0.5.4 [2017-07-14]
* Added: .muttrc
* Added: .sbt/

### v0.5.3 [2017-06-02]
* Fixed: OS X meta for Emacs

### v0.5.2 [2017-06-02]
* Fixed: Some improvements in Emacs config

### v0.5.1 [2017-04-09]
* Removed: custom emacs themes directory
* Added: sample mc config - .config/mc/ini
* Added: sr-speedbar emacs plugin (filesystem tree side panel)

### v0.5.0 [2017-03-13]
* Fixed: st config (with delete key)
* Fixed: dwm config (with volume change keys)
* Fixed: emacs config (refactoring)
* Fixed: zshrc config (some aliases)
* Added: scala influence in emacs config
* Added: simple black theme (based on hober-theme) in emacs
* Added: some fonts (fire mono, droind mono, m8+)
* Upgraded: fonts (Iosevka,monaco,progmata pro,etc)
* Removed: .wl (wanderlust) config
* Removed: sample web-servers configs
* Removed: some unused fonts

### v0.4.2 [2016-11-18]
* Added GO-fonts (https://blog.golang.org/go-fonts) to the collection of fonts

### v0.4.1 [2016-10-22]
* Minor edits in README.md

### v0.4 [2016-10-22]
* Added tmux config file
* Upgrade Iosevka fonts (from 1.9.2 to 1.9.4)
* Added st (http://st.suckless.org/) config file
* Added dwm (http://dwm.suckless.org/) config file

### v0.3 [2016-08-11]
* Some refactoring in emacs config.
* Separate emacs config in multiple small files.
* Upgrade Iosevka fonts (from 1.7.1 to 1.9.2)
* Added eslint config and emacs connections witn him.

### v0.2 [2016-01-18]
* Update fonts collection.
* Few fixes in emacs config.
* Some fixes and changes in  README file.

### v0.1 [2015-10-20]
* Wrote README file.
* Collection contains the best (according to the author) fonts for programming.
* Added basic, working version of the configuration files: emacs, zsh, cwm, Xdefaults and xinitrc.
