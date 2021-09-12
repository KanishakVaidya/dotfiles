#! /bin/bash

stat=$(cat /sys/class/power_supply/BAT0/status)
levl=$(cat /sys/class/power_supply/BAT0/capacity)
case $stat in
	Full) echo "  $levl% " ;;
	Charging) echo "  $levl% "; echo ; echo \#0044ff ; echo \#151515 ;;
	Discharging)
		if [[ levl -lt 5  ]]; then
            notify-send -u critical "Khud e utha jana ab mene ek minute ke andar $(shutdown -P +1). shutdown -c hi bcha skta tujhe ab" -a BATTERY -t 30000
			echo "  $levl% "
			echo
			echo \#ff4500
			echo \#151515
		elif [[ levl -lt 20  ]]; then
			notify-send -u critical "Bhagwan Ke Naam pe Utha le re baba" -a BATTERY -t 30000
			echo "  $levl% "
			echo
			echo \#ff4500
			echo \#151515
		elif [[ levl -lt 40  ]]; then
			echo "  $levl% "
			echo
			echo \#ffa500
			echo \#151515
		elif [[ levl -lt 60  ]]; then
			echo "  $levl% "
			echo
			echo \#adff2f
			echo \#151515
		elif [[ levl -lt 80  ]]; then
			echo "  $levl% "
			echo
			echo \#7cfc00
			echo \#151515
		else
			echo "  $levl% "
			echo 
			echo \#ffffff
			echo \#151515
		fi
	;;
	"Not charging") echo "  $levl% " ;;
esac
