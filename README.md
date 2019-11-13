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

### fish port functions

I've written some very basic fish functions that somewhat act as a wrapper for port. By no means do you have to use these. Took me the space of 20 minutes to write all these and have been helpful, especially if you wish to install a package from source. Here's the full list below:
- **psearch \<package\>**: Search for a package in ports; e.g. ``psearch firefox``
- **pinstall \<group/package\> [--source/-s]**: Install a package either from source or binary blob; e.g. ``pinstall www/firefox --source``
- **premove \<group/package\>**: Remove a package that's installed on the system; e.g ``premove www/firefox``
- **pupdate**: Update the ports collection;
- **pupgrade**: Upgrade FreeBSD, applying any new patches;
- **pstats**: Returns info about the installed packages.

### Keybindings

All of the key bindings for dwm are found [here](https://gitlab.com/lcook/freebsd/blob/master/.suckless/app/dwm/config.h#L67). The default modkey is set to the Windows metakey.

| Keybinding | Action |
| :--- | :--- |
| `Mod + j` | Focus to next client
| `Mod + k` | Focus to previous client
| `Mod + Shift + j` | Move client stack forward
| `Mod + Shift + k` | Move client stack backward
| `Mod + Enter` | Open terminal
| `Mod + Shift + t` | Theme chooser dmenu prompt
| `Mod + Space` | Program launcher
| `Mod + t` | Tiling layout mode
| `Mod + f` | Floating layout mode

### Customization

I've made the process of changing the system theme convenient and easy, not the paradigm of 'you have to recompile dwm everytime which makes it hard' as that's simply not true (unless you lack the competence to run a simple keybind). For this to work all you need to do is press ``Mod + Shift + t`` and you'll be prompted by dmenu to choose a theme: select the theme you desire; press enter; wait a few seconds (this automatically recompiles the suckless software); dwm will restart and it's done. Your newly compiled dwm, st and dmenu now awaits with your newly set background wallpaper (alongside any other arbitrary configuration files manipulated by [slctl](https://gitlab.com/lcook/slctl)). The only caveat is any preexisting windows will be reset to tiling mode so I'd suggest choosing the theme before changing - this is not an issue, as not often you'll be messing with it - on the odd occasion you do it's trivial to move the windows back around as you see fit. =)

### Screenshots

![](https://s.wired.sh/misc/rice/rose.png)
![](https://s.wired.sh/misc/rice/blossom.png)
![](https://s.wired.sh/misc/rice/zenmint.png)
![](https://s.wired.sh/misc/rice/zenglace.png)

# Prerequisites

There isn't much prerequisites as the bootstrap script makes it *for the most part* autonomous. Before you continue running the setup you need to meet the following conditions:
- Basic UNIX/BSD* knowledge;
- Freshly installed FreeBSD system;
- Git, bash and doas installed ``pkg install git-lite bash doas``. I'd like to make bash redundant but the bourne shell doesn't support arrays ~~damn POSIX~~;
- User added to the doas config file with 'nopass' enabled for that user (makes life much easier, run this command on the root account): ``echo "permit nopass YOUR_USER as root" | tee -a /usr/local/etc/doas.conf``. This isn't a good practice allowing non-privileged users running doas as root without root password. However security isn't a number one priority in this type of environment, it's simply for the sake of convenience;
- Everything else is pulled in by the setup script. Nothing else required - only a brain and common sense.

### Setup and installation

There's not much to it (given you've met the prerequisites). *Now for the fun part*:
- Clone this repo ``git clone --recursive https://gitlab.com/lcook/freebsd`` (remove ``--recursive`` to prevent cloning my [Emacs configuration](https://gitlab.com/lcook/emacs) repository) and change to that given directory;
- From there you'll find a setup script that you can run by typing ``./bootstrap`` and everything else is done for you;
- The default shell is changed to fish so you'll be prompted to enter your password for the chsh command;
- Note: the **x11-fonts/nerd-fonts** package is fairly large, give it time to download and extract (be patient).

### Autonomous installation

Since [this commit](https://gitlab.com/lcook/freebsd/commit/f597ebceeccc6867cd7e6b8cef02afe768f41792) you can install the entire setup autonomously without needing to attend each dialog. To enable this behaviour pass ``-auto`` to the bootstrap script. If you also need to include display drivers you can provide either ``-nvidia`` or ``-virtualbox``, the according packages as well as startup services will be configured for you.

*As simple as that*. You should be done now, given my mediocre scripting has worked for you. I'd suggest rebooting the system once the setup script has completed.
