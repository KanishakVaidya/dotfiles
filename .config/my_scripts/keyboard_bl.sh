#! /bin/bash

# In case /sys/class/.../backlight file does not have proper permission
# follow this link https://unix.stackexchange.com/a/593121

brightness=$(awk '{print}' /sys/class/leds/asus::kbd_backlight/brightness)
max_bright=$(awk '{print}' /sys/class/leds/asus::kbd_backlight/max_brightness)

case $1 in
    'inc') awk -v MAX=$max_bright '{print ($1 + 1)%(MAX + 1)}' /sys/class/leds/asus::kbd_backlight/brightness > /sys/class/leds/asus::kbd_backlight/brightness ;;
    'dec') awk -v MAX=$max_bright '{if($1 == 0) print MAX; else print ($1 - 1)}' /sys/class/leds/asus::kbd_backlight/brightness > /sys/class/leds/asus::kbd_backlight/brightness ;;
esac

