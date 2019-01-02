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
	logger "Tablet mode on, mouse $1"
	# TODO do touchpad buttons
	# Trackpoint includes the red joystick and also the mouse buttons
	xinput disable "ETPS/2 Elantech TrackPoint"
	xinput disable "ETPS/2 Elantech Touchpad"
	nohup onboard >/dev/null 2>&1 &
	;;
    on)
	logger "Tablet mode off, mouse $1"
	# for some reason this isn't working, we can't enable the touchpad again! 

	xinput enable "ETPS/2 Elantech Touchpad"
	xinput enable "ETPS/2 Elantech TrackPoint"
	killall onboard
	;;
	*)
	logger "ACPI action undefined: $1" 
	;;
esac

