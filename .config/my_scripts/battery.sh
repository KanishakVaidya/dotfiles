#! /bin/bash

stat=$(cat /sys/class/power_supply/BAT0/status)
levl=$(cat /sys/class/power_supply/BAT0/capacity)
case $stat in
	Full) echo "  $levl% " ;;
	Charging) echo "  $levl% "; echo ; echo \#0044ff  ; echo \#111111 ;;
	Discharging)
		if [[ levl -lt 20  ]]; then
			notify-send -u critical "Main LOW hoon. Mujhe bchao" -a BATTERY -t 30000
			echo "  $levl% "
			echo
			echo \#ff4500
			echo \#111111
		elif [[ levl -lt 40  ]]; then
			echo "  $levl% "
			echo
			echo \#ffa500
			echo \#111111
		elif [[ levl -lt 60  ]]; then
			echo "  $levl% "
			echo
			echo \#adff2f
			echo \#111111
		elif [[ levl -lt 80  ]]; then
			echo "  $levl% "
			echo
			echo \#7cfc00
			echo \#111111
		else
			echo "  $levl% "
			echo 
			echo \#ffffff
			echo \#111111
		fi
	;;
	"Not charging") echo "  $levl% " ;;
esac
