#! /bin/bash

stat=$(cat /sys/class/power_supply/BAT0/status)
levl=$(cat /sys/class/power_supply/BAT0/capacity)
case $stat in
	Full) echo "  $levl% " ;;
	Charging) echo "  $levl% "; echo ; echo \#000000 ; echo \#0044ff ;;
	Discharging)
		if [[ levl -lt 20  ]]; then
			notify-send -u critical "Main LOW hoon. Mujhe bchao" -a BATTERY -t 30000
			echo "  $levl% "
			echo
			echo \#000000
			echo \#ff4500
		elif [[ levl -lt 40  ]]; then
			echo "  $levl% "
			echo
			echo \#000000
			echo \#ffa500
		elif [[ levl -lt 60  ]]; then
			echo "  $levl% "
			echo
			echo \#000000
			echo \#adff2f
		elif [[ levl -lt 80  ]]; then
			echo "  $levl% "
			echo
			echo \#000000
			echo \#7cfc00
		else
			echo "  $levl% "
			echo 
			echo \#000000
			echo \#ffffff
		fi
	;;
	"Not charging") echo "  $levl% " ;;
esac
