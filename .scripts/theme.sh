#!/usr/bin/env bash
sudo make -j3 install clean -C ~/.suckless/dwm
sudo make -j3 install clean -C ~/.suckless/st
accent=$(grep "theme" ~/.suckless/themes/theme.h | cut -b 24-32 | sed s/\"//g)
background=$(grep "theme" ~/.suckless/themes/theme.h | cut -b 35-43 | sed s/\"//g)
convert ~/.scripts/.bsd.png -fuzz 20% -trim +repage -fill $accent -opaque "#333333" ~/.scripts/.bsd-icon.png
convert -size 2560x1080 canvas:$background -gravity center ~/.scripts/.bsd-icon.png -composite ~/.scripts/.background.png
~/.scripts/background.sh
