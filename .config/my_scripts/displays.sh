#!/bin/bash

option=$(echo "Primary only
Secondary only
Mirror
Extend Secondary to RIGHT
Extend Secondary to LEFT" | rofi -dmenu -theme material.rasi -theme-str 'listview { scrollbar: false; lines: 5;}')

if [ "$option" == "Primary only" ]
then
	xrandr --output HDMI-1 --off --output eDP-1 --mode 1920x1080 
	i3-msg restart
elif [ "$option" == "Secondary only" ]
then
	xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 
	i3-msg restart
elif [ "$option" == "Mirror" ]
then
	xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --same-as eDP-1	
	i3-msg restart
elif [ "$option" == "Extend Secondary to RIGHT" ]
then
	xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --right-of eDP-1
	i3-msg restart
elif [ "$option" == "Extend Secondary to LEFT" ]
then
	xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --left-of eDP-1
	i3-msg restart
fi
