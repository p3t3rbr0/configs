xset -b
xrdb ~/.Xdefaults
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll"
exec feh --bg-scale ~/data/media/wallpapers/calamar_1366_768.jpg &
exec compton -CGb &
exec cwm
