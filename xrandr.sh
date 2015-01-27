#!/bin/sh
dp0=`xrandr -q | grep "DP-0 disconnected" > /dev/null ; echo $?`
dp2=`xrandr -q | grep "DP-2 disconnected" > /dev/null ; echo $?`
dp6=`xrandr -q | grep "DP-6 disconnected" > /dev/null ; echo $?`

xrandr --output LVDS-0 --mode 1920x1080 --refresh 60 --right-of DP-2

if [ $dp0 != '0' -a $dp2 != '0' ] ; then
    xrandr --output LVDS-0 --off
    xrandr --output DP-2 --mode 1920x1200 --refresh 60 --right-of DP-0
    xrandr --output DP-0 --mode 1920x1200 --refresh 60 
fi

if [ $dp0 != '0' -a $dp2 = '0' ] ; then
    xrandr --output DP-0 --mode 1920x1200 --refresh 60 --right-of LVDS-0
fi
