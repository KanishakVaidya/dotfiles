echo " $(date '+ %a %b %d    %H:%M') "
echo 
awk '/color14:/ {print $2}' ~/.Xresources
awk '/background:/ {print $2}' ~/.Xresources

case $BLOCK_BUTTON in
	1) kdialog --calendar CALENDAR --geometry=400x330-5+25 >> /dev/null ;;
esac
