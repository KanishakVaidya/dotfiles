echo " $(date '+ %a %b %d  %H:%M') "
echo 
awk '/color14:/ {print $2}' ~/.Xresources
awk '/background:/ {print $2}' ~/.Xresources

show_month() { 
	mnth=$1
	year=$2
    posn=$3
	option=$(echo "<<
$(cal -v $mnth $year)
>>"| rofi -dmenu -p 'Calendar' -location 3 -yoffset 25 -lines 12 -selected-row $posn -theme flat-orange.rasi -theme-str 'window {width: 16%; lines: 12;}')
	case $option in
        ">>")
			mnth=$((10#$mnth + 1))
			if [[ $mnth == '13' ]] ; then
				mnth='1'
				year=$((year + 1))
			fi
			show_month $mnth $year 9
			;;
		"<<")
			mnth=$((10#$mnth - 1))
			if [[ $mnth == '0' ]] ; then
				mnth='12'
				year=$((year - 1))
			fi
			show_month $mnth $year 0
			;;
	esac
	exit
		}	


case $BLOCK_BUTTON in
    1) show_month $(date "+%m %Y") $(expr $(date +%w) + 2)  ;;			
	3) cal -v $(date +%Y) | rofi -dmenu -location 3 -yoffset 20 -theme-str 'window {width: 40%;} listview {fixed-height: true; lines: 37;}' -theme flat-orange.rasi -selected-row $(expr \( \( $(date +%m) - 1 \) / 3 \) \* 9 + $(date +%w) + 3) ;;
esac
