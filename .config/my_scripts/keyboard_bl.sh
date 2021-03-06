#! /bin/bash

brightness=$(awk '{print}' /sys/class/leds/asus::kbd_backlight/brightness)

case $1 in
    'inc') awk '{print ($1 + 1)%4}' /sys/class/leds/asus::kbd_backlight/brightness > /sys/class/leds/asus::kbd_backlight/brightness ;;
    'dec')  awk '{if($1 == 0) print 3; else print ($1 - 1)}' /sys/class/leds/asus::kbd_backlight/brightness > /sys/class/leds/asus::kbd_backlight/brightness ;;
esac

