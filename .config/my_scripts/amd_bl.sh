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
brightness=$(awk '{print}' /sys/class/backlight/amdgpu_bl*/brightness)

case $changeto in
	'increase') 
		if [[ $brightness -lt 255 ]]; then
			echo $(awk "BEGIN {print $brightness + 5; exit}") > /sys/class/backlight/amdgpu_bl*/brightness ;
		fi
	;;
	'decrease') 
		if [[ $brightness -gt 20 ]]; then
			echo $(awk "BEGIN {print $brightness - 5; exit}") > /sys/class/backlight/amdgpu_bl*/brightness ;
		fi
	;;
esac

awk '{print "  " $1 " "}' /sys/class/backlight/amdgpu_bl*/brightness
echo
awk '/color3:/ {print $2}' ~/.Xresources
awk '/background:/ {print $2}' ~/.Xresources
