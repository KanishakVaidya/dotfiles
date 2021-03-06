#! /bin/bash

toggle_lang () {
	if [[ $(setxkbmap -query | awk '/layout/{print $2}') == 'us' ]]; then
		setxkbmap in
	else
		setxkbmap us
	fi
}

case $BLOCK_BUTTON in
	1) toggle_lang ;;
esac

red=$(awk '/color1:/ {print $2}' ~/.Xresources)
background=$(awk '/background:/ {print $2}' ~/.Xresources)

echo "  $(setxkbmap -query | awk '/layout/{print $2}') "
echo
if [[ $(xset q | awk '/Caps Lock/{print $4}') == 'off' ]]; then
	echo $red
else
	echo $background
	echo $red
fi
