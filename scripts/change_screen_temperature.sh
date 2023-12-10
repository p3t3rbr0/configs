#!/bin/sh

#
# Change screen temperature script over redshift <http://jonls.dk/redshift/>.
#
# Usage: ./change_screen_temperature.sh [number:0-6500]
#
# Example: ./change_screen_temperature.sh 3500
#

set -eu

defval=5500
file="/tmp/cur_temperature"

if [ ! -f "$file" ]; then
	echo "$defval" > $file
fi

val=$((`cat $file`$1))

echo "$val" > $file

redshift -o -t $val:$val > /dev/null
