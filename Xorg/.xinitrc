#!/bin/sh
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output HDMI-A-0 --mode 1920x1080 --rate 144 --pos 0x0 --rotate left --output HDMI-A-1 --primary --mode 2560x1440 --rate 144 --pos 1080x240 --rotate normal --output DVI-D-0 --off
setxkbmap -option caps:swapescape
redshift-gtk -l 8.28:124.39 -t 6500:3600 &
dunst &
flameshot &
/usr/lib/notification-daemon-1.0/notification-daemon &
exec qtile start

