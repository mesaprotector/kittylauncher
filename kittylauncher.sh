#!/bin/bash
cd "~/.local/state/kittylauncher";
PROMPT_COMMAND='PS1="! > "; xdotool type "kitty-launch "' kitty -T "Kitty Launcher" sh -c 'bash -t';
cd "~/.local/state/kittylauncher";
nohup ~/.local/state/kittylauncher/_output
