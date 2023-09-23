#!/bin/sh

#
# Remove unused MacOS native applications.
#
# Usage: [MNT=<mount point>] [DISK=<block device filename>] ./remove_macos_apps.sh
#
# Example: MNT=~/my/mnt DISK=/dev/disk1s5 ./remove_macos_apps.sh
#

set -eu

MNT=${MNT:-$HOME/opt/mnt}
DISK=${DISK:-/dev/disk1s5}

APPLICATIONS_PATH=$MNT/System/Applications
UTILITIES_PATH=$APPLICATIONS_PATH/Utilities

mount -o nobrowse -t apfs $DISK $MNT

size=0

for application in \
    "Automator" \
    "App Store" \
    "Books" \
    "Contacts" \
    "Dictionary" \
    "FaceTime" \
    "FindMy" \
    "Freeform" \
    "Home" \
    "Mail" \
    "Maps" \
    "Messages" \
    "Music" \
    "News" \
    "Notes" \
    "Photos" \
    "Podcasts" \
    "Reminders" \
    "Siri" \
    "Stickies" \
    "Stocks" \
    "Shortcuts" \
    "Time Machine" \
    "TV" \
    "TextEdit" \
    "VoiceMemos" \
    "Weather";
do
    echo "Deleting application: ${application} ..."
    size=$(($size + $(du -sm "${APPLICATIONS_PATH}/${application}.app" |awk '{ print $1 }')))
    rm -rf "${APPLICATIONS_PATH}/${application}.app"
done

for utility in \
    "Activity Monitor" \
    "Bluetooth File Exchange" \
    "Boot Camp Assistant" \
    "ColorSync Utility" \
    "Console" \
    "Digital Color Meter" \
    "Grapher" \
    "Keychain Access" \
    "Migration Assistant" \
    "Screenshot" \
    "Script Editor" \
    "VoiceOver Utility";
do
    echo "Deleting utility: ${utility} ..."
    size=$(($size + $(du -sm "${UTILITIES_PATH}/${utility}.app" |awk '{ print $1 }')))
    rm -rf "${UTILITIES_PATH}/${utility}.app"
done

echo
echo "Released ${size} Mib."

echo
echo "Creating fs snapshot and unmounting ..."
bless --folder $MNT/System/Library/CoreServices --bootefi --create-snapshot
diskutil unmount $MNT

echo
echo "Done"
