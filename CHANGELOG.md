
# ChangeLog

## v0.9.7 [2024-03-05]
* [emacs] Fix python config section

## v0.9.6 [2024-02-23]
* [fonts] Upgrade Iosevka fonts (to 28.1.0)

## v0.9.5 [2024-02-03]
* [fonts] Upgrade Go fonts (to 2.010)
* [fonts] Upgrade Iosevka fonts (to 28.0.7)

## v0.9.4 [2024-02-01]
* [fonts] Upgrade Iosevka fonts (to 28.0.5)

## v0.9.3 [2023-12-17]
* Cleanup .zshrc
* Remove .icons/ directory
* Fix name of script/change\_screen\_temperature.sh
* Fix scripts/disable\_macos\_services.sh
* [fonts] Upgrade Iosevka fonts (to 28.0.0)
* [scala] Add configs: .scalafmt.conf and .scalafix.conf

## v0.9.2 [2023-09-23]
* Update scripts (scripts/*)
* Move History of versions to CHANGELOG.md
* [python] Add config - pytest.ini
* [python] Upgrade configs: mypy.ini, .coveragerc, .flake8, .pydocstyle

## v0.9.1 [2023-09-21]
* [emacs] Improve cperl-mode checks
* [emacs] Add explicit warning level
* [emacs] Use httpS for [m]elpa repostories
* [emacs] Remove elpy for python-mode
* [fonts] Upgrade Iosevka fonts (to 27.0.1)
* [mutt] Fix default account name
* [macos] Add scripts: macos\_disable\_services.sh and macos\_remove\_apps.sh

## v0.9.0 [2023-04-23]
* Improved README
* Improved .zshrc
* Improved i3-wm and i3status config
* Added scripts/{ch\_brightness.sh,ch\_temperatures.sh,start\_irony\_server.sh,slupgrade.pl}

## v0.8.9 [2023-04-22]
* [wm] Fixed fvwm config
* [wm] Added i3wm and i3status configs
* [fonts] Upgraded: Input, Iosevka, FiraCode, CascadiaCode
* [fonts] Added SourceCodePro

## v0.8.8 [2022-12-08]
* [emacs] Removed PerlySense (now only cperl mode)

## v0.8.7 [2022-06-25]
* Removed .sbt/
* Added configs for FVWM (window manager)
* Added confgis for sx (start an xorg server)
* [fonts] Upgraded (all)
* [emacs] Fixed perly_sense
* [emacs] Fixed metals lsp server for Scala
* [py3] Added configs for flake8, pydocstyle, isort, coverage, mypy

## v0.8.6 [2022-01-01]
* Reaggregated fonts
* Removed font (Droid Sans Mono)
* Upgraded fonts (Anonymous Pro Minus 1.003, Cascadia 2108.26, FiraCode 5.2, Iosevka 10.3.0)

## v0.8.5 [2020-12-27]
* Added yaml-mode
* Added lsp-mode for Scala lang (scala-mode, sbt, metals)
* Fixed: pomidor plugin inclusion
* Fixed: js2-mode plugin inclusion
* Removed: nyan-mode plugin
* Upgraded fonts (Iosevka 3.4.0 -> 3.6.3)

## v0.8.4 [2020-08-09]
* Added `insert-timestamp` function to emacs
* Fixed: README* typo
* Fixed default perl5 paths for emacs flycheck
* Upgraded fonts (Iosevka 2.3.0 -> 3.4.0)

## v0.8.3 [2020-02-06]
* Added nyan-mode for Emacs
* Fixed perly_sense error show (using flymake)

## v0.8.2 [2019-11-08]
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

## v0.8.1 [2019-07-23]
* Added yasnippet for Emacs
* Fixed init.el config (typo)

## v0.8.0 [2019-06-08]
* Rewrited Emacs config (total rewrite)
* Fixed slupgrade.pl
* Fixed .muttrc
* Fixed README.md
* Upgraded sbt 1.0 -> 1.2
* Upgraded fonts (Iosevka 2.0.2 -> 2.2.1)

## v0.7.6 [2018-12-21]
* Fixed .emacs.d
* Fixed .eslintrc
* Fixed README.md (date format)
* Upgraded: fonts (Iosevka to v2.0.2)
* Remove wallpapers
* Remove gattaca - the custom emacs theme

## v0.7.5 [2018-09-10]
* Fixed .perltidyrc (refactoring and add new rules)

## v0.7.4 [2018-09-10]
* Fixed .cwmrc
* Fixed .muttrc
* Upgraded: sbt-ensime
* Upgraded: fonts (Iosevka v2.0.0)

## v0.7.3 [2018-06-23]
* Upgraded: sbt-ensime (from v2.2.0 to v2.6.1)
* Upgraded: fonts (Iosevka v1.14.3, Hack v3.003)
* Removed: integral_orbit.* wallpapers
* Removed: st and dwm config directories

## v0.7.2 [2018-02-17]
* Removed: st config
* Removed: dwm config
* Added: some wallpapers
* Added: cursor icons (neutral)
* Fixed: .tmux.conf (small refactoring)

## v0.7.1 [2018-02-17]
* Upgraded: sbt-ensime (from v2.0.1 to v2.2.0)

## v0.7.0 [2018-02-17]
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

## v0.6.3 [2018-02-10]
* Fixed: .cwmrc (disable rofi)
* Fixed: .mailcap (add default charset - utf8)
* Fixed: .muttrc (multiple small fixes)
* Fixed: .tmux.conf (remove hostname from tabbar)
* Fixed: redshift config (disable geoclue by default)

## v0.6.2 [2017-10-21]
* Fixed: .cwmrc (fixed window groups)
* Fixed: .perltidy (improved rules)
* Fixed: .tmux.conf (fixed infobar and 256 colors mode)
* Fixed: .emacs.d (changed several shortcuts, some fixes in console mode)

## v0.6.1 [2017-08-18]
* Removed: duplicate eslintrc

## v0.6.0 [2017-08-18]
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

## v0.5.6 [2017-07-28]
* Added: .mailcap
* Added: .rtorrent.rc
* Fixed: Multiple fixes (colors and external html viewer) in .muttrc

## v0.5.5 [2017-07-23]
* Fixed: URxvt color and fonts in .Xdefaults

## v0.5.4 [2017-07-14]
* Added: .muttrc
* Added: .sbt/

## v0.5.3 [2017-06-02]
* Fixed: OS X meta for Emacs

## v0.5.2 [2017-06-02]
* Fixed: Some improvements in Emacs config

## v0.5.1 [2017-04-09]
* Removed: custom emacs themes directory
* Added: sample mc config - .config/mc/ini
* Added: sr-speedbar emacs plugin (filesystem tree side panel)

## v0.5.0 [2017-03-13]
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

## v0.4.2 [2016-11-18]
* Added GO-fonts (https://blog.golang.org/go-fonts) to the collection of fonts

## v0.4.1 [2016-10-22]
* Minor edits in README.md

## v0.4 [2016-10-22]
* Added tmux config file
* Upgrade Iosevka fonts (from 1.9.2 to 1.9.4)
* Added st (http://st.suckless.org/) config file
* Added dwm (http://dwm.suckless.org/) config file

## v0.3 [2016-08-11]
* Some refactoring in emacs config.
* Separate emacs config in multiple small files.
* Upgrade Iosevka fonts (from 1.7.1 to 1.9.2)
* Added eslint config and emacs connections witn him.

## v0.2 [2016-01-18]
* Update fonts collection.
* Few fixes in emacs config.
* Some fixes and changes in  README file.

## v0.1 [2015-10-20]
* Wrote README file.
* Collection contains the best (according to the author) fonts for programming.
* Added basic, working version of the configuration files: emacs, zsh, cwm, Xdefaults and xinitrc.
