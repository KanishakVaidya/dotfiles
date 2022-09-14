#! /bin/bash

option=$(echo -e "Screen\nArea\nWindow" | rofi -dmenu -p "Screenshot" -theme my_horizontal.rasi)

case $option in
	Screen) scrot ~/pic/$(date '+Screenshot_%Y-%m-%d_%H-%M-%S.png') ;;
	Area) scrot -s ~/pic/$(date '+Screenshot_%Y-%m-%d_%H-%M-%S.png') ;;
	Window) scrot -u ~/pic/$(date '+Screenshot_%Y-%m-%d_%H-%M-%S.png') ;;
esac
