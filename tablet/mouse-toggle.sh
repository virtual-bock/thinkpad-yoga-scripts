#!/bin/bash
# Simple script to toggle on/off the ThinkPad Yoga's Trackpoint and Clickpad
# and kill/launch. To be binded with switches when switching between tablet/laptop
# modes.
#
# Must be run as user running X11.
#
# https://github.com/ffejery/thinkpad-x380-yoga-scripts
#
# Originally from AdmiralAkber:
# https://github.com/admiralakber/thinkpad-yoga-scripts
# Author: AdmiralAkber

case "$1" in
    off)
	xinput disable "ETPS/2 Elantech Touchpad"
	nohup onboard >/dev/null 2>&1 &
	;;
    on)
	xinput enable "ETPS/2 Elantech Touchpad"
	killall onboard
	;;
esac

