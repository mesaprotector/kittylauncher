#!/bin/bash
cd "/home/asuka/.local/state/kittylauncher";
PROMPT_COMMAND='PS1="! > "; xdotool type "kitty-launch "' kitty -T "Kitty Launcher" sh -c 'bash -t';
cd "/home/asuka/.local/state/kittylauncher";
nohup ~/.local/state/kittylauncher/_output
