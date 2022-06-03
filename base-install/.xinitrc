#!/bin/sh
xrandr --output DP-1 --off --output DP-2 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-2 --primary --mode 2560x1440 --pos 1080x240 --rotate normal --output DVI-D-1 --off
redshift-gtk -l 8.28:124.39 -t 6500:3600 &
dunst &
flameshot &
/usr/lib/notification-daemon-1.0/notification-daemon &
picom &

exec dbus-launch leftwm

