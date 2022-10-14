#!/usr/bin/env bash

white=$(awk '/color7:/ {print $2}' ~/.Xresources)
back=$(awk '/background:/ {print $2}' ~/.Xresources)
red=$(awk '/color1:/ {print $2}' ~/.Xresources)
if [ -z ${BLOCK_BUTTON+x} ]; then
    BLOCK_BUTTON=$1
fi
case $BLOCK_BUTTON in
	2) changeto='mute' ;;
    3) changeto='nothing' ; pavucontrol-qt ;;
	4) changeto='increase' ;;
	5) changeto='decrease' ;;
esac
case $changeto in
	'increase')
        pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
	'decrease')
        pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
    'mute') pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
esac

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume/{print $5+0}')
if [[ $(pactl get-sink-mute @DEFAULT_SINK@) == "Mute: yes" ]]; then
	echo " 婢 Mute "
	echo
	echo $white
	echo $back
elif [[ vol -lt 30  ]]; then
	echo "  $vol% "
	echo
	echo $white
	echo $back
elif [[ vol -lt 60  ]]; then
	echo "  $vol% "
	echo
	echo $white
	echo $back
elif [[ vol -lt 101  ]]; then
	echo "  $vol% "
	echo
	echo $white
	echo $back
else
	echo "  $vol% "
	echo
	echo $red
	echo $back
fi
