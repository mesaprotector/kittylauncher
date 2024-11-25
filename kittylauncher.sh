#!/bin/bash
# Define all directories first. Probably easier to do this another way.
if [ -z "$XDG_CONFIG_HOME" ]; then 
	configdir="$HOME/.config"
else
	configdir="$XDG_CONFIG_HOME"
fi
statedir="`cat "$configdir"/kittylauncherrc | grep ^statedir \
| cut -d '=' -f 2-2`"
if [ -z "$statedir" ]; then
	if [ -z "$XDG_STATE_HOME" ]; then
		statedir="$HOME/.local/state/kittylauncher"
	else
		statedir="$XDG_STATE_HOME/kittylauncher"
	fi
fi
workdir="`cat "$configdir"/kittylauncherrc | grep ^workdir | cut -d '=' -f 2-2`"
if [ -z "$workdir" ]; then
	workdir="$HOME"
fi
configdir="`eval echo "$configdir"`"
statedir="`eval echo "$statedir"`"
workdir="`eval echo "$workdir"`"
cd "$statedir" || exit;
# Check if caps lock is on and turn it off if so.
if [ "`xset q | grep Caps | awk '{print $4}'`" = "on" ]; then
	xdotool key Caps_Lock
fi
# Launch terminal.
PROMPT_COMMAND='PS1="! > "; xdotool type "kitty-launch "' \
kitty -T "Kitty Launcher" sh -c 'bash -t';
# Run command from workdir.
cd "$workdir" || exit;
nohup "$statedir"/_output > "$statedir"/nohup.out
