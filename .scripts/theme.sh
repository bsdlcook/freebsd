#!/usr/bin/env bash
sudo make -j3 install clean -C ~/.suckless/dwm
sudo make -j3 install clean -C ~/.suckless/st
accent=$(grep "theme" ~/.suckless/themes/theme.h | cut -b 24-32 | sed s/\"//g)
background=$(grep "theme" ~/.suckless/themes/theme.h | cut -b 35-43 | sed s/\"//g)
foreground=$(grep "theme" ~/.suckless/themes/theme.h | cut -b 46-54 | sed s/\"//g)
convert ~/.scripts/.bsd.png -fuzz 20% -trim +repage -fill $accent -opaque "#333333" ~/.scripts/.bsd-icon.png
convert -size 2560x1080 canvas:$background -gravity center ~/.scripts/.bsd-icon.png -composite ~/.scripts/.background.png
sed -i '' s/$(cat ~/.config/zathura/zathurarc | grep "highlight-color" | awk '{print $3}' | sed s/\"//g)/$accent/g ~/.config/zathura/zathurarc
sed -i '' s/$(cat ~/.config/zathura/zathurarc | grep "recolor-lightcolor" | awk '{print $3}' | sed s/\"//g)/$background/g ~/.config/zathura/zathurarc
sed -i '' s/$(cat ~/.config/zathura/zathurarc | grep "statusbar-fg" | awk '{print $3}' | sed s/\"//g)/$foreground/g ~/.config/zathura/zathurarc
~/.scripts/background.sh
