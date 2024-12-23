#!/bin/bash
# Exit if running as root.
if [ "`/bin/id -u`" = "0" ]; then
	exit
fi

# Find config file. If it doesn't exist, copy the default to that location.
if [ -z "$XDG_CONFIG_HOME" ]; then 
	configdir="$HOME/.config"
else
	configdir="$XDG_CONFIG_HOME"
fi
configdir="`eval echo "$configdir"`"
if [ ! -f "$configdir/kittylauncherrc" ]; then
	cp /usr/share/kittylauncher/kittylauncherrc "$configdir/kittylauncherrc"
fi

# Set statedir location listed in config file. Create if it doesn't exist.
statedir="`cat "$configdir"/kittylauncherrc | grep ^statedir \
| cut -d '=' -f 2-2`"
if [ -z "$statedir" ]; then
	if [ -z "$XDG_STATE_HOME" ]; then
		statedir="$HOME/.local/state/kittylauncher"
	else
		statedir="$XDG_STATE_HOME/kittylauncher"
	fi
fi
statedir="`eval echo "$statedir"`"
if [ ! -d "$statedir" ]; then
	mkdir "$statedir"
fi

# Set workdir location listed in config file.
workdir="`cat "$configdir"/kittylauncherrc | grep ^workdir | cut -d '=' -f 2-2`"
if [ -z "$workdir" ]; then
	workdir="$HOME"
fi
workdir="`eval echo "$workdir"`"

# Switch working directory to workdir.
cd "$workdir" || exit;

# Launch terminal. Use entr/ttyecho if possible, otherwise xdotool.
if [ "`pgrep -f "/lib/kittylauncher/prefill.sh" | wc -l`" = 0 ]; then
	if [ "`xset q | grep Caps | awk '{print $4}'`" = "on" ]; then
		xdotool key Caps_Lock
	fi
	PROMPT_COMMAND='PS1="! > "; xdotool type "kitty-launch "' \
	kitty -T "Kitty Launcher" sh -c 'bash -t'
else
	statedir="$statedir" \
	PROMPT_COMMAND='PS1="kitty-launch! > "; echo "`tty`" > "$statedir"tty' \
	kitty -T "Kitty Launcher" sh -c 'bash -t'
fi

# Run command from workdir after terminal exits.
nohup "$statedir"/_output > "$statedir"/nohup.out
