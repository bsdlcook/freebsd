![](https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Freebsd_logo.svg/500px-Freebsd_logo.svg.png)
# What is this?
This repository is my current FreeBSD setup as of June 2018, which comes with my custom configuration files. Some of these include the following: 
- **fish**: Custom functions to easily install ports either from source or binary blobs (see ~/.config/fish/functions/ for the available commands);
- **neovim**: Fork of vim that's updated frequently, including useful plugins to make developement easier, keymaps, etc;
- **dwm**: dwm (short for dynamic window manager) is a bare-bones window manager written for X where you patch in the features you want;
- **st**: The suckless terminal. A *very*, if not most minimal terminal that follows the suckless software philosophy;
- **ranger**: Lightweight terminal-based-all-in-one-file-manager you'll ever need;
- There's also configuration files for dmenu, tmux, neofetch, htop, zathura (pdf viewer with vim bindings) and a few others.

**fish port functions**

I've written some very basic fish functions that somewhat act as a wrapper for port. By no means do you have to use these. Took me the space of 20 minutes to write all these and have been helpful, especially if you wish to install a package from source. Here's the full list below:
- **psearch \<package\>**: Search for a package in ports; ``e.g psearch firefox``
- **pinstall \<group/package\> [--source/-s]**: Install a package either from source or binary blob; ``e.g. pinstall www/firefox --source``
- **premove \<group/package\>**: Remove a package that's installed on the system; ``e.g. premove www/firefox``
- **pupdate**: Update the ports collection;
- **pupgrade**: Upgrade FreeBSD, applying any new patches;
- **pstats**: Returns info about the installed packages.

Granted, this workflow (for me personally) helps me get things done a lot quicker (especially  with my keybindings) - I'm not guaranteeing this is the right setup for you. If you find anything to improve /and/or/ criticize I'm open to suggestions, simply open a PR and I'll take a look into it. For this setup I've made it easier to change the theme. You can apply the theme you want for dwm, st, dmenu and wallpaper by changing the hex values within the ``~/.suckless/theme.h`` header file. The script ``~/.script/theme.sh`` compiles dwm and st, creates a background (``~/.script/.background.png``) that's then applied as the wallpaper. All of the colors are relative to the header file, for example, changing the accent color to white (``#FFF``) will be shown in dwm, st and the wallpaper - it's as simple as that. I've tried to keep this setup of mine as minimalistic and simplistic as I can for ease of use. Once you've changed the accent run the command ``theme.sh`` to apply it, for the theme to take effect on /dwm/st/ press the modkey (Windows key) and q to restart dwm. By default in dwm st is started with a tmux session. If you wish to change that navigate to ``~/.suckless/dwm/config.h`` and remove tmux from the command that starts st.

*Note: All of the key bindings for dwm are in ``~/.suckless/dwm/config.h``.* The modkey is set to the Windows key, a quick overview of the bindings are as following:
- **Mod + Enter**: Open a terminal;
- **Mod + q**: Restart dwm (needed after when ran with ``theme.sh``, note that this will restart the layout to tiling mode);
- **Mod + r**: Start dmenu, program launcher;
- **Mod + t**: Tiling layoug mode;
- **Mod + f**: Floatig layout mode;
- **Mod + g**: Grid layout mode.

# Prerequisites
There isn't much prerequisites as the setup script makes it *for the most part* autonomous. Before you continue running the setup I assume you're under these following conditions:
- Basic /UNIX/BSD*/ knowledge;
- Recently installed FreeBSD;
- Git installed (``pkg install git``);
- Bash installed (``pkg install bash``) - I'd like to make bash redundant but the bourne shell doesn't support arrays ~~damn POSIX~~;
- Sudo installed (``pkg install sudo``) and the user added to the sudoers file with NOPASSWD enabled for that user (makes life much easier): ``echo "YOUR_USER ALL=(ALL) NOPASSWRD: ALL" | sudo tee -a /usr/local/etc/sudoers``;
- I'm aware this isn't a good practice allowing users running sudo without a password. Security isn't a number one priority in this type of environment; simply for the sake of convenience.
- Everything else is pulled in by the setup script. Nothing else required - only a brain and common sense.

# Setup
There's not much to it (given you've met the prerequisites). *Now for the fun part*:
- Changing your current directory to ``/tmp`` with of course ``cd /tmp``;
- Cloning this repo ``git clone https://gitlab.com/omnistar/freebsd-setup`` and changing to that given directory ``cd freebsd-setup``;
- From there you'll find a setup script ``setup.sh`` that you can run by typing ``./setup.sh`` and everything else is done for you;
- When changing the default shell ``chsh`` you'll be prompted to enter your password;
- What the script does is check if the required packages are installed, change the default shell to fish and install the IBM Plex Mono fonts. Feel free to check the script.

*As simple as that*. You should be done now, given my mediocre scripting has worked for you. I'd suggest rebooting the system once the setup script has completed.

# Screenshots
Glorious screenshots of my setup.

- Default accent ``#FF6B57`` and background ``#1C1C1C``:
![](./screenshots/1.png)
![](./screenshots/2.png)
![](./screenshots/3.png)

- Accent ``#5F27CD``:
![](./screenshots/4.png)

- Accent ``#10AC84``:
![](./screenshots/5.png)

- Accent ``#E46A6B`` and background ``#3F3F3F``:
![](./screenshots/6.png)
