![](https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Freebsd_logo.svg/500px-Freebsd_logo.svg.png) 

# Preface

This repository is my current FreeBSD setup as of June 2018 to present, which comes with my custom configuration files. Some of these include the following (but not limited to): 
- **fish**: Custom functions to easily install ports either from source or binary blobs (see ~/.config/fish/functions/ for the available commands);
- **dwm**: dwm (short for dynamic window manager) is a bare-bones window manager written for X where you patch in the features you want;
- **st**: The suckless terminal. A *very*, if not most minimal terminal that follows the suckless software philosophy;
- **zathura**: A minimal pdf viewer also with vim keybindings.

There's also configuration files for: dmenu; neofetch; htop and a few others that I use.

# fish port functions

I've written some very basic fish functions that somewhat act as a wrapper for port. By no means do you have to use these. Took me the space of 20 minutes to write all these and have been helpful, especially if you wish to install a package from source. Here's the full list below:
- **psearch \<package\>**: Search for a package in ports; e.g. ``psearch firefox``
- **pinstall \<group/package\> [--source/-s]**: Install a package either from source or binary blob; e.g. ``pinstall www/firefox --source``
- **premove \<group/package\>**: Remove a package that's installed on the system; e.g ``premove www/firefox``
- **pupdate**: Update the ports collection;
- **pupgrade**: Upgrade FreeBSD, applying any new patches;
- **pstats**: Returns info about the installed packages.

# Workflow

Granted, this work-flow helps various mundane tasks less insufferable (for me personally) and much more time efficient if you know how to use it correctly; adapt the setup to your heart's content so under no circumstances am I guaranteeing this is for *you* specifically. If there's anything to improve and/or critique I'm open to suggestions, simply create a pull request or issue and I'll take a look into it when I have the time to.

I've made the process of changing the system theme convenient and easy, not the paradigm of 'you have to recompile dwm everytime which makes it hard' as that's simply not true (unless you lack the competence to run a simple keybind). For this to work all you need to do is press ``Mod + Shift + t`` and you'll be prompted by dmenu to choose a theme: select the theme you desire; press enter; wait a few seconds (this automatically recompiles the suckless software); dwm will restart and it's done. Your newly compiled dwm, st and dmenu now awaits with your newly set background wallpaper (alongside any other arbitrary configuration files manipulated by the script). The only caveat is any preexisting windows will be reset to tiling mode so I'd suggest choosing the theme before changing - this is not an issue, as not often you'll be messing with it - on the odd occasion you do it's trivial to move the windows back around as you see fit. =)

# Screenshots

![](https://s.wired.sh/misc/rice/rose.png)
![](https://s.wired.sh/misc/rice/blossom.png)
![](https://s.wired.sh/misc/rice/zenmint.png)
![](https://s.wired.sh/misc/rice/zenglace.png)

# Keybindings

All of the key bindings for dwm are in **~/.suckless/dwm/config.h**.* The default modkey is set to the Windows metakey.

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

# Prerequisites

There isn't much prerequisites as the bootstrap script makes it *for the most part* autonomous. Before you continue running the setup you need to meet the following conditions:
- Basic UNIX/BSD* knowledge;
- Freshly installed FreeBSD system;
- Git, bash and doas installed ``pkg install git-lite bash doas``. I'd like to make bash redundant but the bourne shell doesn't support arrays ~~damn POSIX~~;
- User added to the doas config file with 'nopass' enabled for that user (makes life much easier, run this command on the root account): ``echo "permit nopass YOUR_USER as root" | tee -a /usr/local/etc/doas.conf``. This isn't a good practice allowing non-privileged users running doas as root without root password. However security isn't a number one priority in this type of environment, it's simply for the sake of convenience;
- Everything else is pulled in by the setup script. Nothing else required - only a brain and common sense.

# Setup

There's not much to it (given you've met the prerequisites). *Now for the fun part*:
- Clone this repo ``git clone https://gitlab.com/syne/freebsd`` and change to that given directory;
- From there you'll find a setup script that you can run by typing ``./bootstrap`` and everything else is done for you;
- The default shell is changed to fish so you'll be prompted to enter your password for the chsh command;
- Note: the **x11-fonts/nerd-fonts** package is fairly large, give it time to download and extract (be patient).

*As simple as that*. You should be done now, given my mediocre scripting has worked for you. I'd suggest rebooting the system once the setup script has completed.

# Themes

I've included a simplistic theme manager script for dwm/st/dmenu/etc located at **~/.scripts/sys-themes-apply**. As of now there's a few theme configs (**~/.suckless/themes/**) that you can apply to the system, run with the keybind ``Mod + Shift + t`` as explained earlier on this README. The script directory is appended to the $PATH environment variable meaning you can run ``sys-themes-apply [theme]`` or ``sysa [theme]`` (shorthand alias to sys-themes-apply) from anywhere in the terminal (this also applies to any other script inside **~/.scripts/**) but it's best advised to use the keybind. To view the current themes on the system run: ``sys-themes`` and this will return a full list including the theme name: accent; background; foreground and the border hex values (use ``sysl`` as a shorthand alias to ``sys-themes``). 

Themes are placed within **~/.suckless/themes/**, divided into folders and defined in the configuration file for each given theme. In a nutshell they're read from this [script](https://gitlab.com/syne/freebsd/blob/master/.scripts/sys-themes-apply) that generates a C header file the suckless utils inherit for their appearance, alongside any other arbitrarily placed scripts to run - I wont go into great detail with what happens as it's self-explanatory in the script. A brief rundown would be: you pass in the theme **zen/glace** (theme group/theme) to ``sys-themes-apply`` and checks if it (**~/.suckless/themes/zen/glace.conf**) exists else it'll quit. The contents of that file is:
```sh
accent=#AFBEDE
background=#021B21
foreground=#E4DBB3
solid_background=#043845
dwm_border_active=${accent}
dwm_border_inactive=${background}   
dwm_border_px=2
st_padding_px=25
```
From this, the header file is created and outputted to **~/.suckless/themes/theme.h**. The suckless utils are then recompiled. Here's the current variables that you can use:

| Variable | Description | Default |
| :--- | :--- | :--- |
| `accent` | Main accent color used for walpaper icon/dwm/st/dmenu/etc | #1177AA
| `background` | Main background color used for wallpaper background/dwm/st/dmenu/etc | #000000
| `solid_background` | When the wallpaper is generated by default, an icon from an svg is composited onto the wallpaper. Define this variable to replace that for a solid background wallpaper | None
| `foreground` | Foreground text color for dwm/st/dmenu/etc | #FFFFFF
| `wallpaper` | If defined, this will be used as the wallpaper (place wallpapers in **~/.scripts/.themer/bg/** and use the filename without the extenstion as the value) | None
| `dwm_border_active` | Color for active window border | #6592A8
| `dwm_border_inactive` | Color for inactive window border | #405D6B
| `dwm_border_px` | Pixel size for window borders |1
| `dwm_showbar` | Display the statusbar | 1
| `dwm_topbar` | Display the statusbar at the top of the screen | 1
| `dwm_horizpadpx` | Horizontal padding for statusbar | 1
| `dwm_vertpadpx` | Vertical padding for statusbar | 15
| `dwm_tagind` | Current tag indicator | 1
| `st_padding_px` | Inner-padding for st | 15
| `st_colors` | Array of colors for st | [see here](https://gitlab.com/syne/freebsd/blob/master/.scripts/sys-themes-apply#L28)

Play around with these. You can get some nice looking setups from this - trial and error, basically. To add your own theme it's very trivial to do: create a file in **~/.suckless/themes/[group]/[theme].conf** then away you go. Use the current themes as a reference if needed.

-- syne
