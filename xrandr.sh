#!/bin/sh
dp0=`xrandr -q | grep "DP1 disconnected" > /dev/null ; echo $?`
dp2=`xrandr -q | grep "HDMI1 disconnected" > /dev/null ; echo $?`
dp6=`xrandr -q | grep "eDP1 disconnected" > /dev/null ; echo $?`


 xrandr --output eDP1 --auto --pos 0x0 --output DP1 --primary --auto --rotate normal --right-of eDP1 --output HDMI1 --auto --rotate normal --right-of DP1
