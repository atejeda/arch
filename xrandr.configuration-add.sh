#!/usr/bin/env bash
# from some askubutu.com forum

RESOLUTION="3440 1440 100"
OUTPUT="DVI-D-0"

MODELINE=$(cvt $RESOLUTION | grep -v \#)
MODEDATA=$(echo $MODELINE | cut -f 3- -d' ')
MODENAME=$(echo $MODELINE | cut -f2 -d' ')

echo xrandr --newmode \"$MODENAME\" \"$MODEDATA\"
echo xrandr --addmode $OUTPUT $MODENAME
echo xrandr --output $OUTPUT --mode $MODENAME
