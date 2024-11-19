# kittylauncher
Use terminal emulator as basic application launcher

Just launches a small terminal window with "kitty-launch" prefilled (using xdotool; if I ever migrate to Wayland I'll switch
to using a systemd service with entr + ttyecho, the same as my other project). I didn't like the desktop-entry paradigm for
launching applications, and I've always done it from the terminal, but with the result of some annoying SIGHUP and stdout
spam behavior. 

The kitty-launch function parses a set number of arguments according to the config file, basically allowing you to have
separate aliases from what is in your .bashrc. It then writes the parsed output to a file called _output, which is itself
executed by the wrapper kittylauncher.sh script. 

Future tasks are: 
- more configurability (set paths in kittylauncherrc)
- figure out how to package literally anything
