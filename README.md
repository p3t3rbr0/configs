## About this repositiry
This repository is a collection of the author's configuration files for some *nix-desktop programs, such as: cwm, emacs,  tmux, mutt, urxvt and more.

*This is not a silver bullet, but simply way to organize and maintain for unified "look and feel" on different PC's, running on Unix-Like OS.*

The author also hopes that this examples of configuration files will be useful to anyone else.

**The author is not responsible for the relevance, correctness, completeness and quality of the information provided.**

## Depencences

* Basic
  * sx
  * i3
  * zsh
  * cwm
  * feh
  * moc
  * fvwm
  * tmux
  * mutt
  * lynx
  * urxvt
  * emacs
  * picom
  * redshift
* Optional
  * npm (for using eslint in Emacs)

Make sure that these packages are installed on your system.

For Debian-based distribution:

```shell
$ apt-get install zsh sx i3-wm i3status feh moc tmux mutt lynx rxvt-unicode-256color emacs picom redshift
```

For Arch Linux

```shell
$ pacman -Si zsh sx i3-wm i3status feh moc tmux mutt lynx rxvt-unicode emacs picom redshift
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
$ pip install ipython flake8 isort black mypy pydocstyle
```

### Perl

```shell
$ cpan i Perl::Critic Perl::Tidy Devel::Cover
```

### Markdown

``` shell
$ apt-get install multimarkdown
```

``` shell
$ brew install multimarkdown
```
