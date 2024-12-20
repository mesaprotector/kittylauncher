#!/bin/bash
# Watch a file and push the string `kitty-launch` to the device listed in the
# file if it is ever modified. 
echo "$statedir/tty" | entr -np "ttyecho "`cat "$statedir/tty"` kitty-launch"
