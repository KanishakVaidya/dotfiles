#!/bin/bash 

grey=$(awk '/color8/{print $2}' ~/.Xresources)
white=$(awk '/color7/{print $2}' ~/.Xresources)
back=$(awk '/background/{print $2}' ~/.Xresources)

prev_state=$(cat /tmp/prev-connection-state)

if [ -z ${BLOCK_BUTTON+x} ]; then
    BLOCK_BUTTON=$1
fi
case $BLOCK_BUTTON in
	1) networkmanager_dmenu & ;;
    2) nm-connection-editor & ;;
esac

IF=$(ip route | awk '/^default/{print $5}')
#echo $IF


if [[ "$IF" = "" ]] || [[ "$(cat /sys/class/net/$IF/operstate)" = 'down' ]]; then
    echo " 轢 "
    echo ""
    echo $grey
    echo $back

    [[ $prev_state == connected  ]] && ( notify-send "Internet" "Disconnected" & echo "disconnected" > /tmp/prev-connection-state ) || true

    exit
elif [[ "$(cat /sys/class/net/$IF/operstate)" = 'up' ]]; then
    [[ $IF == w* ]] && echo " 直 " || echo "  "
    echo ""
    echo $white
    echo $back

    [[ $prev_state != connected  ]] && ( notify-send "Internet" "Connected to $(iwgetid -r || echo network)" & echo "connected" > /tmp/prev-connection-state ) || true

    exit
fi
