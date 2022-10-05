#!/bin/sh
#xrandr --output eDP-1 --mode 2256x1504 --rate 60
xrdb ~/desire.Xresources
xrandr --output eDP-1 --mode 2256x1504 --pos 2560x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-4 --off --output DP-3 --primary --mode 2560x1440 --pos 0x32 --rotate normal --rate 144
#setxkbmap -option caps:swapescape
redshift &
dunst &
picom &
solaar &
brightnessctl set 1%

exec dbus-launch leftwm

