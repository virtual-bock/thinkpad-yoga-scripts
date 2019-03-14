further edits to the L380 scripts to fit the x380. This is because there appears to be no tablet mode hotkey for the x380.

Status:
- [x] rotatation
- [x] brightness adjustment
- [x] turn off touchscreen when using pen
- [ ] turn off touchpad and trackpoint in tablet mode
  - [x] Changed to use acpi hook since it lacks hotkey
    - [ ] BUG: doesn't always fire
    - [x] I'm adding this to startup `/usr/bin/acpi_listen | /opt/thinkpad-x380-yoga-scripts/tablet/acpi_tablet_monitor.sh`
  - [x] BUG: touchpad wont enable again, this seems to be a driver bug

forked from :https://github.com/ffejery/thinkpad-l380-yoga-scripts

For more tweaks for Xubuntu on a Thinkpad x380 yoga see [this gist](https://gist.github.com/wassname/4aec086afe518dfbceaf00577442c432)

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
sudo systemctl enable yoga-tablet@${USER}.service
sudo systemctl start yoga-tablet@${USER}.service
sudo systemctl status yoga-tablet@${USER}.service

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

