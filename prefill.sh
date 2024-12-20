#!/bin/bash
# Watch a file and push the string `kitty-launch` to the device listed in the
# file if it is ever modified. 
while true; do
	echo "$statedir/tty" | entr -npz true
	ttyecho "`cat "$statedir/tty"`" "kitty-launch "
done
