#!/bin/bash

displays=( )

for display in $(xrandr | awk '/ connected / {print $1}')
do
    displays+=($display)
done

option=$(echo "${displays[0]} only
${displays[1]} only
Mirror
${displays[0]} left of ${displays[1]}
${displays[1]} left of ${displays[0]}" | rofi -dmenu -p "Choose display configuration" -theme material.rasi -theme-str 'listview { scrollbar: false; lines: 5;}')

if [ "$option" == "${displays[0]} only" ]
then
	xrandr --output ${displays[1]} --off --output ${displays[0]} --mode 1920x1080
	i3-msg restart
elif [ "$option" == "${displays[1]} only" ]
then
	xrandr --output ${displays[0]} --off --output ${displays[1]} --mode 1920x1080
	i3-msg restart
elif [ "$option" == "Mirror" ]
then
	xrandr --output ${displays[0]} --mode 1920x1080 --output ${displays[1]} --same-as ${displays[0]}
	i3-msg restart
elif [ "$option" == "${displays[0]} left of ${displays[1]}" ]
then
	xrandr --output ${displays[0]} --mode 1920x1080 --output ${displays[1]} --mode 1920x1080 --right-of ${displays[0]}
	i3-msg restart
elif [ "$option" == "${displays[1]} left of ${displays[0]}" ]
then
	xrandr --output ${displays[0]} --mode 1920x1080 --output ${displays[1]} --mode 1920x1080 --left-of ${displays[0]}
	i3-msg restart
fi
