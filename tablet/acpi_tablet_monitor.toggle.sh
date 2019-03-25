#!/bin/bash
# toggles tablet mode
if synclient -l | egrep "TouchpadOff.*= *0"; then
    xinput disable "ETPS/2 Elantech TrackPoint"
    synclient TouchpadOff=1 
    nohup onboard >/dev/null 2>&1 &
    echo "tablet mode"
else
    xinput enable "ETPS/2 Elantech TrackPoint"
    synclient TouchpadOff=0
    killall onboard
    echo "normal mode"
fi
