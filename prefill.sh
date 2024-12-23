#!/bin/bash
# Remove trailing slash in statedir if necessary.
_statedir="`echo "$statedir" | sed -s 's/\/$//g'`"
statedir="$_statedir"
# Watch a file and push the string `kitty-launch` to the device listed in the
# file if it is ever modified. 
while true; do
	echo "$statedir/tty" | entr -npz true
	ttyecho "`cat "$statedir/tty"`" "kitty-launch "
done
