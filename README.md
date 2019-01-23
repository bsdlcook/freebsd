![](https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Freebsd_logo.svg/500px-Freebsd_logo.svg.png) 
# What is this?
This repository is my current FreeBSD setup as of June 2018 to present, which comes with my custom configuration files. Some of these include the following (but not limited to): 
- **fish**: Custom functions to easily install ports either from source or binary blobs (see ~/.config/fish/functions/ for the available commands);
- **neovim**: Fork of vim that's updated frequently, including useful plugins to make developement easier, keymaps, etc;
- **dwm**: dwm (short for dynamic window manager) is a bare-bones window manager written for X where you patch in the features you want;
- **st**: The suckless terminal. A *very*, if not most minimal terminal that follows the suckless software philosophy;
- **vifm**: Lightweight terminal-based-all-in-one-file-manager you'll ever need with vim keybindings;
- **zathura**: A minimal pdf viewer also with vim keybindings.

There's also configuration files for: dmenu; tmux; neofetch; htop and a few others that I use.

**fish port functions**

I've written some very basic fish functions that somewhat act as a wrapper for port. By no means do you have to use these. Took me the space of 20 minutes to write all these and have been helpful, especially if you wish to install a package from source. Here's the full list below:
- **psearch \<package\>**: Search for a package in ports; e.g. ``psearch firefox``
- **pinstall \<group/package\> [--source/-s]**: Install a package either from source or binary blob; e.g. ``pinstall www/firefox --source``
- **premove \<group/package\>**: Remove a package that's installed on the system; e.g ``premove www/firefox``
- **pupdate**: Update the ports collection;
- **pupgrade**: Upgrade FreeBSD, applying any new patches;
- **pstats**: Returns info about the installed packages.

**Work-flow**

Granted, this work-flow helps various mundane tasks less insufferable (for me personally) and much more time efficient if you know how to use it correctly; adapt the setup to your heart's content so under no circumstances am I guaranteeing this is for *you* specifically. If there's anything to improve and/or critique I'm open to suggestions, simply create a pull request or issue and I'll take a look into it when I have the time to. I've made the process of changing the system theme convenient and easy, not the paradigm of 'you have to recompile dwm everytime which makes it hard' as that's simply not true (unless you lack the competence to run a simple keybind). For this to work all you need to do is press ``Mod + Shift + t`` and you'll be prompted by dmenu to choose a theme: select the theme you desire; press enter; wait a few seconds (this automatically recompiles the suckless software); dwm will restart and it's done. Your newly compiled dwm, st and dmenu now awaits with your newly set background wallpaper (alongside any other arbitrary configuration files manipulated by the script). The only caveat is any preexisting windows will be rest to tiling mode so I'd suggest choosing the theme before changing - this is not an issue, as not often you'll be messing with it - on the odd occasion you do it's trivial to move the windows back around as you see fit.   

*Note: All of the key bindings for dwm are in **~/.suckless/dwm/config.h**.* The modkey is set to the Windows key, a quick overview of the bindings are as following:
- ``Mod + Enter``: Open a terminal;
- ``Mod + Shift + t``: Theme chooser dmenu prompt;
- ``Mod + q``: Restart dwm;
- ``Mod + r``: Launch dmenu (program launcher);
- ``Mod + t``: Tiling layout mode;
- ``Mod + f``: Floating layout mode;
- ``Mod + g``: Grid layout mode.

# Prerequisites
There isn't much prerequisites as the post-setup script makes it *for the most part* autonomous. Before you continue running the setup you need to meet the following conditions:
- Basic UNIX/BSD* knowledge;
- Freshly installed FreeBSD system;
- Git, bash and doas installed ``pkg install git bash doas``. I'd like to make bash redundant but the bourne shell doesn't support arrays ~~damn POSIX~~;
- User added to the doas config file with 'nopass' enabled for that user (makes life much easier, run this command on the root account): ``echo "permit nopass YOUR_USER as root" | tee -a /usr/local/etc/doas.conf``. This isn't a good practice allowing non-privileged users running doas as root without root password. However security isn't a number one priority in this type of environment, it's simply for the sake of convenience.
- Everything else is pulled in by the setup script. Nothing else required - only a brain and common sense.

# Setup
There's not much to it (given you've met the prerequisites). *Now for the fun part*:
- Clone this repo ``git clone https://gitlab.com/love_lace/freebsd-setup`` and change to that given directory;
- From there you'll find a setup script that you can run by typing ``./post-install.sh`` and everything else is done for you;
- The default shell is changed to fish so you'll be prompted to enter your password for the chsh command;
- Note: the **x11-fonts/nerd-fonts** package is fairly large, give it time to download and extract (be patient).

*As simple as that*. You should be done now, given my mediocre scripting has worked for you. I'd suggest rebooting the system once the setup script has completed.

# Theme manager
I've included a simplistic theme manager script for dwm/st/dmenu etc located at **~/.scripts/themer.sh**. As of now there's a few theme configs (**~/.suckless/themes/**) that you can apply to the system, run with the keybind ``Mod + Shift + t`` as explained earlier on this README. The script directory is appended to the $PATH environment variable meaning you can run ``themer.sh`` from anywhere in the terminal (this also applies to any other script inside ``~/.scripts/``) but it's best advised to use the keybind.

**How does it work?**
Themes are read from **~/.suckless/themes/\*.conf** parsing the hex values with awk, then using sed to replace those values inside of **~/.suckless/themes/theme.h** which /dwm/st/dmenu inherits. To add your own theme it's as following:
- Create a new file in **~/.suckless/themes/** with the given file extension conf (this is crucial for it the script to detect it!) e.g. **epictheme.conf**;
- The format of the theme config is ``accent:background:foreground:border:x11-font``, no more, no less. e.g. ``#752A2A:#1C1C1C:#BBBBBB:#44444:Apercu Mono Pro:pixelsize=12:antialias=true:autohint=true``;
- That config will then be parsed and should be available as a theme to choose from - that's it - you can now use ``epictheme``! *easy-as-pie*, right?