#!/usr/bin/env bash
echo -ne "Suckless theme manager script\n\n"
echo -ne "Available themes:\n"
echo -e $(ls ~/.suckless/themes/*.conf | sed "s/\/home\/$USER\/.suckless\/themes\///g" | sed s/.conf//g | sort)  '\n' 
echo -n "[?] Choose a theme: "
read theme
if [ ! -f ~/.suckless/themes/$theme.conf ]; then
	echo -ne "\nNo such theme exists." && exit
fi
awk -F ':' \
	'BEGIN {
		print "\nAccent\tBackground\tForeground\tBorder"
	}
	
	{
		printf("%s\t%s\t\t%s\t\t%s",$1,$2,$3,$4)
	}
	
	END {
	
	}' ~/.suckless/themes/$theme.conf
echo -ne "\n\n[?] Do you wish to use this theme? (y/n) "
read input && input=$(echo $input | tr '[:upper:]' '[:lower:]')
if [ $input == "yes" ] || [ $input == "y" ]; then
	theme_file=~/.suckless/themes/theme.h
	theme_conf=~/.suckless/themes/$theme.conf

	current_accent=$(grep "theme" $theme_file | cut -b 24-32 | sed s/\"//g)
	current_background=$(grep "theme" $theme_file | cut -b 35-43 | sed s/\"//g)	
	current_foreground=$(grep "theme" $theme_file | cut -b 46-54 | sed s/\"//g)
	current_border=$(grep "theme" $theme_file | cut -b 57-65 | sed s/\"//g)

	updated_accent=$(awk -F ':' '{print $1}' $theme_conf)
	updated_background=$(awk -F ':' '{print $2}' $theme_conf)
	updated_foreground=$(awk -F ':' '{print $3}' $theme_conf)
	updated_border=$(awk -F ':' '{print $4}' $theme_conf)
	
	sed -i '' s/"$current_accent"/"$updated_accent"/ $theme_file
	sed -i '' s/"$current_background"/"$updated_background"/ $theme_file
	sed -i '' s/"$current_foreground"/"$updated_foreground"/ $theme_file
	sed -i '' s/"$current_border"/"$updated_border"/ $theme_file
	echo -ne "\nUpdated $theme_file with the $theme theme!" | sed "s/\/home\/$USER\/.suckless\/themes\///g"

	echo -ne "\n\n[?] Do you want to apply this theme to the system? (y/n) "
	read input && input=$(echo $input | tr '[:upper:]' '[:lower:]')
	if [ $input == "yes" ] || [ $input == "y" ]; then
		sudo make clean install -C ~/.suckless/dwm &>/dev/null
		sudo make clean install -C ~/.suckless/st &>/dev/null
		
		sed -i '' s/$(cat ~/.config/zathura/zathurarc | grep "highlight-color" | awk '{print $3}' | sed s/\"//g)/$updated_accent/g ~/.config/zathura/zathurarc
		sed -i '' s/$(cat ~/.config/zathura/zathurarc | grep "recolor-lightcolor" | awk '{print $3}' | sed s/\"//g)/$updated_background/g ~/.config/zathura/zathurarc
		sed -i '' s/$(cat ~/.config/zathura/zathurarc | grep "statusbar-fg" | awk '{print $3}' | sed s/\"//g)/$updated_foreground/g ~/.config/zathura/zathurarc

		convert ~/.scripts/.bsd.png -fuzz 20% -trim +repage -fill $updated_accent -opaque "#333333" ~/.scripts/.bsd-icon.png
		convert -size 2560x1080 canvas:$updated_background -gravity center ~/.scripts/.bsd-icon.png -composite ~/.scripts/.background.png
		feh --bg-fill ~/.scripts/.background.png
	
		echo -ne "\nSystem theme has been applied! Press Mod + q to restart dwm."
	else
		echo -ne "\nGoodbye!" && exit
	fi
else
	echo -ne "\nNo new theme applied." && exit
fi
