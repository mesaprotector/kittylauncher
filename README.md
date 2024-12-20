# kittylauncher
Use terminal emulator as basic application launcher

Just launches a small terminal window with "kitty-launch" prefilled. It can use
either xdotool for this, or a systemd service with entr and ttyecho; the latter 
has some minor overhead, but is Wayland-friendly and slightly faster; you can 
choose which according to preference. I didn't like the desktop-entry paradigm
for launching applications, and I've always done it from the terminal, but with
the result of some annoying STDOUT spam and SIGHUP behavior. 

The kitty-launch function parses a set number of arguments according to the
config file, basically allowing you to have separate aliases from what is in
your .bashrc. It then writes the parsed output to a file called _output, which
is itself executed by the wrapper kittylauncher.sh script.

kittylauncher.sh is meant to be called by a keyboard shortcut. kitty-launch
will not launch anything if run manually but if it is it will display the
command it would have run.

The default config file will copy itself to your $HOME on first run, but the
bash completion script has to be copied over manually if you want to use it.

See open issues for information on future work.
