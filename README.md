![](https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Freebsd_logo.svg/500px-Freebsd_logo.svg.png) 

# Preface

This repository is my current FreeBSD setup as of June 2018 to present, which comes with my custom configuration files. Some of these include the following (but not limited to): 
- **fish**: Custom functions to easily install ports either from source or binary blobs (see ~/.config/fish/functions/ for the available commands);
- **dwm**: dwm (short for dynamic window manager) is a bare-bones window manager written for X where you patch in the features you want;
- **st**: The suckless terminal. A *very*, if not most minimal terminal that follows the suckless software philosophy;
- **zathura**: A minimal pdf viewer also with vim keybindings;
- **emacs**: More than just your usual text editor and my personal development enviroment of choice. This is included as a git submodule from [here](https://gitlab.com/lcook/emacs); to include this you'll need to pass ``--recursive`` when cloning this repo.

There's also configuration files for: dmenu; neofetch; htop and a few others that I use.

# Workflow

Granted, this work-flow helps various mundane tasks less insufferable (for me personally) and much more time efficient if you know how to use it correctly; adapt the setup to your heart's content so under no circumstances am I guaranteeing this is for *you* specifically. If there's anything to improve and/or critique I'm open to suggestions, simply create a pull request or issue and I'll take a look into it when I have the time to.

*I'd like to heavily emphasize on the fact this repo contains configuration files specific to me and myself only, you'll have to manually edit them to suit your needs - by no means is this repo for other than to keep track of my setup and my setup alone.*

### fish port functions

I've written some very basic fish functions that somewhat act as a wrapper for port. By no means do you have to use these. Took me the space of 20 minutes to write all these and have been helpful, especially if you wish to install a package from source. Here's the full list below:
- **psearch \<package\>**: Search for a package in ports; e.g. ``psearch firefox``
- **pinstall \<group/package\> [--source/-s]**: Install a package either from source or binary blob; e.g. ``pinstall www/firefox --source``
- **premove \<group/package\>**: Remove a package that's installed on the system; e.g ``premove www/firefox``
- **pupdate**: Update the ports collection;
- **pupgrade**: Upgrade FreeBSD, applying any new patches;
- **pstats**: Returns info about the installed packages.

### Keybindings

All of the key bindings for dwm are found [here](https://gitlab.com/lcook/freebsd/blob/suckless/dwm/config.h). The default modkey is set to the Windows metakey.

| Keybinding | Action |
| :--- | :--- |
| `Mod + j` | Focus to next client
| `Mod + k` | Focus to previous client
| `Mod + Shift + j` | Move client stack forward
| `Mod + Shift + k` | Move client stack backward
| `Mod + Enter` | Open terminal
| `Mod + Shift + p` | Gitlab project launcher
| `Mod + Shift + s` | Video/audio stream launcher
| `Mod + Shift + m` | Manual launcher
| `Mod + Space` | Program launcher
| `Mod + t` | Tiling layout mode
| `Mod + f` | Floating layout mode

### Screenshots

![](https://space.wired.sh/~vulcan/setup/zen-1.png)
![](https://space.wired.sh/~vulcan/setup/zen-2.png)
![](https://space.wired.sh/~vulcan/setup/zen-3.png)

# Prerequisites

There isn't much prerequisites as the bootstrap script makes it *for the most part* autonomous. Before you continue running the setup you need to meet the following conditions:
- Basic UNIX/BSD* knowledge;
- Freshly installed FreeBSD system;
- Git, bash and doas installed ``pkg install git-lite bash doas``. I'd like to make bash redundant but the bourne shell doesn't support arrays ~~damn POSIX~~;
- User added to the doas config file with 'nopass' enabled for that user (makes life much easier, run this command on the root account): ``echo "permit nopass YOUR_USER as root" | tee -a /usr/local/etc/doas.conf``. This isn't a good practice allowing non-privileged users running doas as root without root password. However security isn't a number one priority in this type of environment, it's simply for the sake of convenience;
- Everything else is pulled in by the setup script. Nothing else required - only a brain and common sense.

### Setup and installation

There's not much to it (given you've met the prerequisites). *Now for the fun part*:
- Clone this repo ``git clone --recursive https://gitlab.com/lcook/freebsd`` (remove ``--recursive`` to prevent cloning my [Emacs configuration](https://gitlab.com/lcook/emacs) and [custom ports](https://gitlab.com/lcook/ports/tree/adhoc) (needed for the Suckless utils) repository) and change to that given directory;
- From there you'll find a setup script that you can run by typing ``./bootstrap`` and everything else is done for you;
- The default shell is changed to fish, as well as configuration files copied to the home directory;
- There's different *phases* of the bootstrapping process that have a set of given tasks, feel free to peek into the script;
- Once these phases have completed it's suggested your reboot your computer;
- Note: the **x11-fonts/nerd-fonts** package is fairly large, give it time to download and extract (be patient).

## Suckless

As of [this commit](https://gitlab.com/lcook/freebsd/commit/cf36358c370a0ed05339924ea83afad848021890) the Suckless tools (dwm, dmenu and st) have been moved to the [suckless branch](https://gitlab.com/lcook/freebsd/tree/suckless)—independent of the master branch. The reasoning for this is that I've individually packaged up them into their own ports, so in order to install them, you'll have to build the ports from my custom adhoc tree.

- Assuming you've followed the previous steps and cloned this repo recursively the custom ports tree will already be there;
- Switch to ``sh`` and type ``for port in $(find ports/x11*/zen-* -type d -depth 0); do doas make install clean -C $port; done``.

You'll now have them installed but as packages, to what I believe is the more sane way of handling them.