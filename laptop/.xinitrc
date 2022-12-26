#!/bin/sh 
xrandr --output eDP-1 --mode 2256x1504 --rate 60
#xrandr --output eDP-1 --mode 2256x1504 --pos 2560x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-4 --off --output DP-3 --primary --mode 2560x1440 --pos 0x32 --rotate normal --rate 144
xrdb ~/desire.Xresources
setxkbmap -option caps:swapescape
xcalib -s 0 ~/Downloads/BOE_CQ_______NE135FBM_N41.icm
redshift &
dunst &
picom &
solaar &
calcurse --daemon
brightnessctl set 1%

exec dbus-launch leftwm

