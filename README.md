# Yoga scripts for the Thinkpad Yoga 12

This contains systemd scripts to allow use of tablet mode, pen, auto rotation, and auto brightness on a Thinkpad Yoga 12.

## Status

Status: Working!

- NT[ ] rotatation
- [x] brightness adjustment
- [x] turn off touchscreen when using pen
- NT[ ] tablet mode turns off touchpad, click buttons, and trackpoint (and turns on screen keyboard)
- NT[ ] sometimes the tablet mode acpi event's arn't reported after some time (or after suspend?). Workout: use a launcher on the panel

This repo is forked from https://github.com/IslamAlam/thinkpad-x380-yoga-scripts with edits for the Yoga 12. Differences are:

~~
- we don't need to disable the keyboard as the buttons depress via hardware
- there seems to be no hotkey for tablet mode, so we need a workaround (I use acpi listen)
- there seems to be a bug where xinput can't enable the touchpad once it's disabled, so we need another workaround
~~
For more tweaks for Xubuntu on a Thinkpad x380 yoga see [this gist](https://gist.github.com/wassname/4aec086afe518dfbceaf00577442c432)

## Dependencies

- xrandr
- xinput
- systemd
- gawk
- xsetwacom (optional for wacom rotation)
- onboard (optional for onscreen keyboard)

## Manual installation

```sh

# place it in this exact location
git clone https://github.com/virtual-bock/thinkpad-yoga-scripts /opt/thinkpad-yoga-scripts

# copy scripts to systemd
sudo cp /opt/thinkpad-yoga-scripts/systemd/* /etc/systemd/system/

# enable scripts
sudo systemctl enable yoga-tablet@${USER}.service
sudo systemctl start yoga-tablet@${USER}.service
sudo systemctl status yoga-tablet@${USER}.service

sudo systemctl enable wacom-proximity@${USER}.service
sudo systemctl start wacom-proximity@${USER}.service
sudo systemctl status wacom-proximity@${USER}.service


sudo systemctl enable yoga-rotate@${USER}.service
sudo systemctl start yoga-rotate@${USER}.service
sudo systemctl status yoga-rotate@${USER}.service

# don't run these if you prefer manual backlight control
sudo systemctl enable yoga-backlight.service
sudo systemctl start yoga-backlight.service
sudo systemctl status yoga-backlight.service

```

## Scripts should fix:

- Screen rotation with accelerometer, including touchscreen, Wacom,
  and Touchpad/TrackPoint geometries

- Disabling of Touchscreen with proximity of Wacom digitizer

- Disabling of Clickpad and TrackPoint when moving to tablet mode

## Usage/Customization:


Depending whether or not your DE rotates the Wacom orientation with
the screen automatically edit the following file accordingly:

    /opt/thinkpad-yoga-scripts/rotate/thinkpad-rotate.py

If you want to use an onscreen keyboard other than onboard, or disable
opening of any keyboard when moving into tablet mode edit:

    /opt/thinkpad-yoga-scripts/tablet/mouse-toggle.sh

If your home directory is not in /home/<username> or your .Xauthority
file is located somewhere other than your home directory you will need
to edit the systemd modules. Likewise if your tablets display is not
:0.

