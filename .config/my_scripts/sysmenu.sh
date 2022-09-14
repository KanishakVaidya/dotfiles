#!/bin/bash

option=$(echo -e "Lock\nLogout\nShutDown\nReboot" | rofi -dmenu -p "Power Menu" -selected-row 0)

case $option in
	Lock) i3lock -t -i ~/pic/lock.png ;;
	Logout) i3-msg exit && logout ;;
	ShutDown) shutdown now ;;
	Reboot) reboot ;;
esac
