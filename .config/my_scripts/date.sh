echo " $(date '+ %a %b %d    %H:%M') "

show_month() { 
	mnth=$1
	year=$2
	option=$(echo "<<
$(cal $mnth $year)
                 >>"| rofi -dmenu -location 3 -yoffset 20 -width 15 -lines 12 -theme flat-orange.rasi -theme_str )
	case $option in
"                 >>")
			mnth=$((mnth + 1))
			if [[ $mnth == '13' ]] ; then
				mnth='1'
				year=$((year + 1))
			fi
			show_month $mnth $year
			;;
		"<<")
			mnth=$((mnth - 1))
			if [[ $mnth == '0' ]] ; then
				mnth='12'
				year=$((year - 1))
			fi
			show_month $mnth $year
			;;
	esac
	exit
		}	


case $BLOCK_BUTTON in
	1) show_month $(date "+%m %Y")  ;;			
	3) cal -v $(date +%Y) | rofi -dmenu -location 3 -yoffset 20 -width 40 -lines 45 -theme flat-orange.rasi -selected-row $(expr \( \( $(date +%m) - 1 \) / 3 \) \* 9 + $(date +%w) + 3) ;;
esac
