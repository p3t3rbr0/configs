#!/bin/sh

#
# Change screen brightness script.
#
# Usage: ./change_screen_brightness.sh [number:0-255]
#
# Example: ./change_screen_brightness.sh 150
#

set -eu

echo $((`cat /sys/class/backlight/amdgpu_bl0/brightness`$1)) > /sys/class/backlight/amdgpu_bl0/brightness
