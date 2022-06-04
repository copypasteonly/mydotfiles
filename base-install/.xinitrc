#!/bin/sh
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate left --rate 144 --output HDMI-A-1 --primary --mode 2560x1440 --pos 1080x240 --rotate normal --rate 144 --output DVI-D-0 --off
redshift &
dunst &
/usr/lib/notification-daemon-1.0/notification-daemon &
picom &

exec dbus-launch leftwm

