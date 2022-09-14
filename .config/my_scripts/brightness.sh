#! /bin/bash
if [ -z ${BLOCK_BUTTON+x} ]; then
    changeto=$1
else
    case $BLOCK_BUTTON in
    	4) 
            changeto='increase'
    	;;
    	5) 
            changeto='decrease'
    	;;
    esac
fi
brightness=$(xrandr --verbose | awk '/Brightness/{print 100*$2}' | awk NR==1 )

case $changeto in
	'increase') 
		if [[ $brightness -lt 100 ]]; then
			xrandr --output eDP --brightness $(awk "BEGIN {print ($brightness + 5)/100; exit}")
		fi
	;;
	'decrease') 
		if [[ $brightness -gt 20 ]]; then
			xrandr --output eDP --brightness $(awk "BEGIN {print ($brightness - 5)/100; exit}")
		fi
	;;
esac

echo "   $(xrandr --verbose | awk '/Brightness/{print 100*$2}' | awk NR==1) "

