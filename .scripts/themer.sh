#!/usr/bin/env bash
# suckless themer script.
# ver 1.
SUCKLESS_DIR=~/.suckless/
THEME_EXT=".conf"
THEME_DIR=$SUCKLESS_DIR\themes/
SCRIPT_DIR=~/.scripts/
declare -a THEMES
# append themes to array.
for THEME in $(find $THEME_DIR -maxdepth 1 -type f -name *$THEME_EXT); do
	THEMES+=($(echo $THEME | sed -e "s/\/home\/$USER\/.suckless\/themes\///g" -e "s/.conf//g"))
done
# check array size.
[ ${#THEMES[@]} -eq 0 ] && exit 1
# select theme from dmenu.
THEME=$(printf "%s\n" ${THEMES[@]} | dmenu -i -p "select theme:")
# check if theme exists.
[[ ${THEMES[@]} =~ $THEME ]] || exit 1
THEME_FILE=$THEME_DIR\theme.h
THEME_CONF=$THEME_DIR$THEME$THEME_EXT
# current settings.
CUR=($(grep -o "#[0-9a-fA-F]\{6\}" $THEME_FILE))
CUR_ACCENT=${CUR[0]}
CUR_BG=${CUR[1]}
CUR_FG=${CUR[2]}
CUR_BORDER=${CUR[3]}
# new theme settings.
NEW=($(grep -o "#[0-9a-fA-F]\{6\}" $THEME_CONF))
NEW_ACCENT=${NEW[0]}
NEW_BG=${NEW[1]}
NEW_FG=${NEW[2]}
NEW_BORDER=${NEW[3]}
# update header file.
sed -i "" -e "s/$CUR_ACCENT/$NEW_ACCENT/"             \
    -i "" -e "s/$CUR_BG/$NEW_BG/"                     \
    -i "" -e "s/$CUR_FG/$NEW_FG/"                     \
    -i "" -e "s/$CUR_BORDER/$NEW_BORDER/" $THEME_FILE \
# recompile suckless software.
doas make clean install -C $SUCKLESS_DIR\dwm &> /dev/null
doas make clean install -C $SUCKLESS_DIR\dmenu &>/dev/null
doas make clean install -C $SUCKLESS_DIR\st &>/dev/null
# update other arbitrary configs:
# zathura.
ZAT_CONF=~/.config/zathura/zathurarc
# annoying hack so that duplicate colors
# dont get mixed up when being replaced. >:(
cat $ZAT_CONF\.bak > $ZAT_CONF
ZAT=($(grep -o "#[0-9a-fA-F]\{6\}" $ZAT_CONF))
ZAT_CUR=($(printf "%s\n" ${ZAT[@]} | sort -us))
ZAT_ACCENT=${ZAT_CUR[0]}
ZAT_BG=${ZAT_CUR[1]}
ZAT_FG=${ZAT_CUR[2]}
sed -i "" -e "s/$ZAT_ACCENT/$NEW_ACCENT/g"   \
    -i "" -e "s/$ZAT_BG/$NEW_BG/g"           \
    -i "" -e "s/$ZAT_FG/$NEW_FG/g" $ZAT_CONF \
# update wallpaper.
BSD=$SCRIPT_DIR\.bsd.png
BSD_ICON=$SCRIPT_DIR\.bsd-icon.png
BSD_BG=$SCRIPT_DIR\.background.png
convert $BSD -fuzz 20% -trim +repage -fill $NEW_ACCENT -opaque "#333333" $BSD_ICON
convert -size 2560x1080 canvas:$NEW_BG -gravity center $BSD_ICON -composite $BSD_BG
feh --bg-fill $BSD_BG
# restart dwm.
xdotool key "Super+q"
