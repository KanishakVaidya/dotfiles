#!/bin/bash

option=$(echo "Primary only
Secondary only
Mirror
Extend Secondary to RIGHT
Extend Secondary to LEFT" | rofi -dmenu -theme material.rasi -theme-str 'listview { scrollbar: false; lines: 5;}')

if [ "$option" == "Primary only" ]
then
	xrandr --output HDMI-A-0 --off --output eDP --mode 1920x1080 
	i3-msg restart
elif [ "$option" == "Secondary only" ]
then
	xrandr --output eDP --off --output HDMI-A-0 --mode 1920x1080 
	i3-msg restart
elif [ "$option" == "Mirror" ]
then
	xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --same-as eDP	
	i3-msg restart
elif [ "$option" == "Extend Secondary to RIGHT" ]
then
	xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --mode 1920x1080 --right-of eDP
	i3-msg restart
elif [ "$option" == "Extend Secondary to LEFT" ]
then
	xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --mode 1920x1080 --left-of eDP
	i3-msg restart
fi
