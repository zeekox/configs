#!/bin/sh
dp0=`xrandr -q | grep "DP-0 disconnected" > /dev/null ; echo $?`
dp2=`xrandr -q | grep "DP-2 disconnected" > /dev/null ; echo $?`
dp6=`xrandr -q | grep "DP-6 disconnected" > /dev/null ; echo $?`


 xrandr --output LVDS1 --auto --pos 0x0 --output DP-0 --primary --auto --rotate normal --right-of LVDS1 --output DP-2 --auto --rotate normal --right-of DP-0
