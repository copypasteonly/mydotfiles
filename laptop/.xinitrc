#!/bin/sh 
#xrandr --output eDP-1 --mode 2256x1504 --rate 60
xrandr --output eDP-1 --mode 2256x1504 --pos 0x0 --rotate normal --rate 60 --output DP-1 --off --output DP-2 --primary --mode 2560x1440 --pos 2256x32 --rate 144 --rotate normal --output DP-3 --off --output DP-4 --off
xrdb ~/desire.Xresources
#setxkbmap -option caps:swapescape
xcalib -s 0 ~/mydotfiles/colorProfile.icm
redshift &
dunst &
picom --config ~/.config/picom.conf &
solaar &
brightnessctl set 3%

exec dbus-launch leftwm
