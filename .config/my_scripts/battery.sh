#!/usr/bin/env bash

# Defining Colors
# white=$(awk '/color7:/ {print $2}' ~/.Xresources)
# green=$(awk '/color2:/ {print $2}' ~/.Xresources)
# yellow=$(awk '/color3:/ {print $2}' ~/.Xresources)
# orange=$(awk '/color11:/ {print $2}' ~/.Xresources)
# red=$(awk '/color1:/ {print $2}' ~/.Xresources)
# back=$(awk '/background:/ {print $2}' ~/.Xresources)


char_icon=("󱟧" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅")
disc_icon=("󱃍" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")

colors=('#569cd6'
        '#f53c3c'
	    '#f37055'
	    '#f37055'
		'#f19663'
		'#f0c172'
		'#d7bc6d'
		'#bab066'
		'#9ca45e'
		'#608b4e'
        '#608b4e')

stat=$(cat /sys/class/power_supply/BAT0/status)
levl=$(cat /sys/class/power_supply/BAT0/capacity)

case $stat in
	Full) text=" $levl%" ;;
	Charging)
        text=" ${char_icon[0]} $levl% "
		color="${colors[0]}"
		for i in {1..10}
		do
			if [[ $levl == $i? ]]
			then
				text="${char_icon[$i]} $levl%"
			fi
		done
	;;
	Discharging)
		if [[ levl -lt 5 ]]; then
            notify-send -u critical " Battery" "Khud e utha jana ab mene ek minute ke andar. shutdown -c hi bcha skta tujhe ab" -a BATTERY -t 30000
			shutdown now
		elif [[ levl -lt 25  ]]; then
			notify-send -u critical " Battery" "Bhagwan Ke Naam pe Utha le re baba" -a BATTERY -t 30000
		fi
        text=" ${disc_icon[0]} $levl%"
		color="${cloros[0]}"
		for i in {1..10}
		do
			if [[ $levl == $i? ]]
			then
				text=" ${disc_icon[$i]} $levl%"
				color="${colors[$i]}"
			fi
		done
	;;
	"Not charging") 
        text=" $levl%"
        color='#d4d4d4';;
    *) text=" ??? " ;;
esac

echo " $text "
echo 
echo $color
echo '#1e1e1e'
