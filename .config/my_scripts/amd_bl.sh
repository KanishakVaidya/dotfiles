#! /bin/bash

# In case /sys/class/.../backlight file does not have proper permission
# follow this link https://unix.stackexchange.com/a/593121
# but add following udev rule 
# ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl0", RUN+="/bin/chmod a+w /sys/class/backlight/%k/brightness"

if [ -z ${BLOCK_BUTTON+x} ]; then
    BLOCK_BUTTON=$1
fi

brand=$(ls /sys/class/backlight/ | head -n 1)

max_brightness=$(awk '{print}' /sys/class/backlight/$brand/max_brightness)
min_brightness=$(expr $max_brightness \/ 12)
brightness=$(awk '{print}' /sys/class/backlight/$brand/brightness)
step=$(expr $max_brightness \/ 51)

case $BLOCK_BUTTON in
	4) 
		if [[ $brightness -lt $max_brightness ]]; then
			echo $(awk "BEGIN {print $brightness + $step; exit}") > /sys/class/backlight/$brand/brightness ;
		fi
	;;
	5) 
		if [[ $brightness -gt $min_brightness ]]; then
			echo $(awk "BEGIN {print $brightness - $step; exit}") > /sys/class/backlight/$brand/brightness ;
		fi
	;;
esac

awk '{print "  " $1 " "}' /sys/class/backlight/$brand/brightness
echo
awk '/color3:/ {print $2}' ~/.Xresources
awk '/background:/ {print $2}' ~/.Xresources
