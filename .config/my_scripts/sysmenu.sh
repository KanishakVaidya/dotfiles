#!/bin/bash

option=$(echo -e "Lock\nLogout\nShutDown\nReboot" | rofi -dmenu -p "Power Menu" \
    -selected-row 0 \
    -theme my-theme \
    -theme-str 'window {width: 15%;}'\
    -location 3\
    -fixed-num-lines 5 \
    -hover-select \
    -me-select-entry '' \
    -me-accept-entry MousePrimary \
    -xoffset -30 -yoffset 40)

case $option in
	Lock) i3lock -c 111111 ;;
	Logout) i3-msg exit || bspc quit ;;
	ShutDown) poweroff ;;
	Reboot) reboot ;;
esac
