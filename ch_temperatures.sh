#!/bin/sh

defval=5500
file="/tmp/cur_temperature"

if [ ! -f "$file" ]; then
	echo "$defval" > $file
fi

val=$((`cat $file`$1))

echo "$val" > $file

redshift -o -t $val:$val > /dev/null
