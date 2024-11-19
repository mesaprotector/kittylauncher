#!/bin/bash
cd "~/.local/state/kittylauncher";
if [ `xset q | grep Caps | awk '{print $4}'` = "on" ]; then
	xdotool key Caps_Lock
fi
PROMPT_COMMAND='PS1="! > "; xdotool type "kitty-launch "' kitty -T "Kitty Launcher" sh -c 'bash -t';
cd "~";
nohup ~/.local/state/kittylauncher/_output > ~/.local/state/kittylauncher/nohup.out
