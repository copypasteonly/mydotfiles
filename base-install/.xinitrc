#!/bin/sh
xrandr --output eDP-1 --mode 2256x1504 --rate 60
setxkbmap -option caps:swapescape
# redshift &
dunst &
picom &
brightnessctl set 1%

exec dbus-launch leftwm

