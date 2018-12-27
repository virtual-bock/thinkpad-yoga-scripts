further edits to the L380 scripts to fit the x380. This is because there appears to be no tablet mode hotkey for the x380.

forked from :https://github.com/ffejery/thinkpad-l380-yoga-scripts


# Dependencies
- xrandr
- xinput
- xbindkeys
- kbd (for setkeycodes)
- systemd
- gawk
- xsetwacom (optional for wacom rotation)
- onboard (optional for onscreen keyboard)

# Manual installation

```sh

git clone https://github.com/wassname/thinkpad-x380-yoga-scripts /opt/thinkpad-x380-yoga-scripts

sudo cp /opt/thinkpad-x380-yoga-scripts/systemd/* /etc/systemd/system/

sudo systemctl enable wacom-proximity@${USER}.service
sudo systemctl start wacom-proximity@${USER}.service
sudo systemctl status wacom-proximity@${USER}.service


sudo systemctl enable yoga-rotate@${USER}.service
sudo systemctl start yoga-rotate@${USER}.service
sudo systemctl status yoga-rotate@${USER}.service

# I prefer manual
#sudo systemctl enable yoga-backlight.service
#sudo systemctl start yoga-backlight.service
#sudo systemctl status yoga-backlight.service

# install acpi hooks (since the tablet mode acpi doesn't seem to register as a hotkey on the x380)
sudo cp ./tablet/thinkpad-* /etc/acpi/events
```

# Scripts should fix:

- Screen rotation with accelerometer, including touchscreen, Wacom,
  and Touchpad/TrackPoint geometries

- Disabling of Touchscreen with proximity of Wacom digitizer

- Disabling of Clickpad and TrackPoint when moving to tablet mode

# Usage/Customization:


Depending whether or not your DE rotates the Wacom orientation with
the screen automatically edit the following file accordingly:

    /opt/thinkpad-x380-yoga-scripts/rotate/thinkpad-rotate.py

If you want to use an onscreen keyboard other than onboard, or disable
opening of any keyboard when moving into tablet mode edit:

    /opt/thinkpad-x380-yoga-scripts/tablet/mouse-toggle.sh

If your home directory is not in /home/<username> or your .Xauthority
file is located somewhere other than your home directory you will need
to edit the systemd modules. Likewise if your tablets display is not
:0.

