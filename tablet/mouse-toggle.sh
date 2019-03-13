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
    # BUG workaround: using xinput to turn the touchpad off works, but I can't turn it back on without restarting. synclient works however.
	#xinput disable "ETPS/2 Elantech Touchpad"
    synclient TouchpadOff=1 
	nohup onboard >/dev/null 2>&1 &
	;;
    on)
	logger "Tablet mode off, mouse $1"
	# for some reason this isn't working, we can't enable the touchpad again! 

	xinput enable "ETPS/2 Elantech Touchpad"
	#ixinput enable "ETPS/2 Elantech TrackPoint"
    synclient TouchpadOff=0
	killall onboard
	;;
	*)
	logger "ACPI action undefined: $1" 
	;;
esac

