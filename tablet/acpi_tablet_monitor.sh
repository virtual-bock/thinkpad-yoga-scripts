#!/bin/bash
acpi_listen | while IFS= read -r ACPI_EVENT;
do
    case "$ACPI_EVENT" in
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
