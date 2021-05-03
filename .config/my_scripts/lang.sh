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

echo "  $(setxkbmap -query | awk '/layout/{print $2}') "
echo
if [[ $(xset q | awk '/Caps Lock/{print $4}') == 'off' ]]; then
	echo \#000000
	echo \#ff00ff
else
	echo \#ff00ff
fi
