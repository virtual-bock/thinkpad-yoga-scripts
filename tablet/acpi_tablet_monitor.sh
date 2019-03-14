#!/bin/bash

while true ; do
read ACPI_EVENT
case "$ACPI_EVENT" in
"ibm/hotkey IBM0068:00 00000080 0000500c")
echo "Stylus removed"
;;
"ibm/hotkey IBM0068:00 00000080 0000500b")
echo "Stylus replaced"
;;
"video/tabletmode TBLT 0000008A 00000001")
xinput disable "ETPS/2 Elantech TrackPoint"
synclient TouchpadOff=1 
nohup onboard >/dev/null 2>&1 &
echo "Tablet mode"
;;
"video/tabletmode TBLT 0000008A 00000000")
xinput enable "ETPS/2 Elantech TrackPoint"
synclient TouchpadOff=0
killall onboard
echo "Normal mode"
;;
*)
echo "Unknown event: '$ACPI_EVENT'"
;;
esac
done
