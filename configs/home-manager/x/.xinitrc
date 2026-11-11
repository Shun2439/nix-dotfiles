#!/bin/sh
source ~/.xprofile

systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP

exec xmonad
