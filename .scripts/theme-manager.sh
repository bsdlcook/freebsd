#!/usr/bin/env bash
declare -a themes
theme_dir=~/.suckless/themes
for theme in $(find $theme_dir/ -type f -name "*.conf"); do
	themes+=($(echo $theme | sed "s/\/home\/$USER\/.suckless\/themes\///g" | sed s/.conf//g))
done
theme_count=${#themes[@]}

if ((theme_count < 1)); then
	echo "No themes found in $theme_dir/."
fi

echo -ne "Suckless theme manager script\n\n"
echo -ne "Available themes:\n"
for ((i = 0; i < theme_count; i++)); do
	if ((i != theme_count-1)); then
		echo -n "[$i] ${themes[$i]}, ";
	else
		echo -n "[$i] ${themes[$i]} ";
	fi
done

echo -ne "\n\n[?] Choose a theme: "
read -r -n1 theme_index
if ((theme_index > theme_count-1 || theme_index < 0)); then
	echo -ne "\n\nNo such theme exists."
else
	theme=${themes[theme_index]}
	echo " [$theme]"
	awk -F ":" \
		'BEGIN {
			print "\nAccent\tBackground\tForeground\tBorder"
		}
		
		{
			printf("%s\t%s\t\t%s\t\t%s",$1,$2,$3,$4)
		}
		
		END {
		
		}' $theme_dir/$theme.conf
	echo -ne "\n\n[?] Do you wish to use this theme? (y/n) "
	read -r -n1 input && input=$(echo $input | tr "[:upper:]" "[:lower:]")
	if [ $input == "y" 2>/dev/null ]; then
		theme_file=$theme_dir/theme.h
		theme_conf=$theme_dir/$theme.conf
		
		current_accent=$(grep "theme" $theme_file | cut -b 24-32 | sed s/\"//g)
		current_background=$(grep "theme" $theme_file | cut -b 35-43 | sed s/\"//g)	
		current_foreground=$(grep "theme" $theme_file | cut -b 46-54 | sed s/\"//g)
		current_border=$(grep "theme" $theme_file | cut -b 57-65 | sed s/\"//g)
		
		updated_accent=$(awk -F ":" '{print $1}' $theme_conf)
		updated_background=$(awk -F ":" '{print $2}' $theme_conf)
		updated_foreground=$(awk -F ":" '{print $3}' $theme_conf)
		updated_border=$(awk -F ":" '{print $4}' $theme_conf)
		
		sed -i "" s/"$current_accent"/"$updated_accent"/ $theme_file
		sed -i "" s/"$current_background"/"$updated_background"/ $theme_file
		sed -i "" s/"$current_foreground"/"$updated_foreground"/ $theme_file
		sed -i "" s/"$current_border"/"$updated_border"/ $theme_file
		echo -ne "\n\nUpdated $theme_file with the $theme theme!" | sed "s/\/home\/$USER\/.suckless\/themes\///g"
		
		echo -ne "\n\n[?] Do you want to apply this theme to the system? (y/n) "
		read -r -n1 input && input=$(echo $input | tr "[:upper:]" "[:lower:]")
		if [ $input == "y" 2>/dev/null ]; then
			echo -ne "\n\nPlease wait..."
			doas make clean install -C ~/.suckless/dwm &>/dev/null
			doas make clean install -C ~/.suckless/st &>/dev/null
			
			zathura_conf=~/.config/zathura/zathurarc
	        	sed -i "" s/$(grep "highlight-color" $zathura_conf | awk '{print $3}' | sed s/\"//g)/$updated_accent/g $zathura_conf
			sed -i "" s/$(grep "recolor-lightcolor" $zathura_conf | awk '{print $3}' | sed s/\"//g)/$updated_background/g $zathura_conf
			sed -i "" s/$(grep "statusbar-fg" $zathura_conf | awk '{print $3}' | sed s/\"//g)/$updated_foreground/g $zathura_conf
            		
			bsd_icon=~/.scripts/.bsd-icon.png
			bsd_background=~/.scripts/.background.png
			convert ~/.scripts/.bsd.png -fuzz 20% -trim +repage -fill $updated_accent -opaque "#333333" $bsd_icon
            		convert -size 2560x1080 canvas:$updated_background -gravity center $bsd_icon -composite $bsd_background
            		feh --bg-fill $bsd_background
			
			echo " System theme has been applied! Press Mod + q to restart dwm."
		else
			echo -ne "\n\nGoodbye!"
		fi
	else
		echo -ne "\n\nNo new theme applied."
	fi
fi
