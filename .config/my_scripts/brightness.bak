#! /bin/bash

brightness=$(xrandr --verbose | awk '/Brightness/{print 100*$2}' | awk NR==1 )

case $BLOCK_BUTTON in
	4) 
		if [[ $brightness -lt 100 ]]; then
			xrandr --output eDP --brightness $(awk "BEGIN {print ($brightness + 5)/100; exit}")
		fi
	;;
	5) 
		if [[ $brightness -gt 20 ]]; then
			xrandr --output eDP --brightness $(awk "BEGIN {print ($brightness - 5)/100; exit}")
		fi
	;;
esac

echo "   $(xrandr --verbose | awk '/Brightness/{print 100*$2}' | awk NR==1) "

