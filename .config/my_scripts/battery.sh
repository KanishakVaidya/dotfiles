#! /bin/bash

# Defining Colors
blue=$(awk '/color12:/ {print $2}' ~/.Xresources)
white=$(awk '/color15:/ {print $2}' ~/.Xresources)
green=$(awk '/color10:/ {print $2}' ~/.Xresources)
yellow=$(awk '/color3:/ {print $2}' ~/.Xresources)
orange=$(awk '/color11:/ {print $2}' ~/.Xresources)
red=$(awk '/color9:/ {print $2}' ~/.Xresources)
back=$(awk '/background:/ {print $2}' ~/.Xresources)


stat=$(cat /sys/class/power_supply/BAT0/status)
levl=$(cat /sys/class/power_supply/BAT0/capacity)
case $stat in
	Full) echo "  $levl% " ;;
	Charging) echo "  $levl% "; echo ; echo $blue ; echo $back ;;
	Discharging)
		if [[ levl -lt 5  ]]; then
            notify-send -u critical "Khud e utha jana ab mene ek minute ke andar $(shutdown -P +1). shutdown -c hi bcha skta tujhe ab" -a BATTERY -t 30000
			echo "  $levl% "
			echo
			echo $red
			echo $back
		elif [[ levl -lt 20  ]]; then
			notify-send -u critical "Bhagwan Ke Naam pe Utha le re baba" -a BATTERY -t 30000
			echo "  $levl% "
			echo
			echo $red
			echo $back
		elif [[ levl -lt 40  ]]; then
			echo "  $levl% "
			echo
			echo $orange
			echo $back
		elif [[ levl -lt 60  ]]; then
			echo "  $levl% "
			echo
			echo $yellow
			echo $back
		elif [[ levl -lt 80  ]]; then
			echo "  $levl% "
			echo
			echo $green
			echo $back
		else
			echo "  $levl% "
			echo 
			echo $white
			echo $back
		fi
	;;
	"Not charging") echo "  $levl% " ; echo ; echo $white ; echo $back ;;
esac
