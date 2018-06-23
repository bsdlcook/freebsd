#!/usr/bin/env bash
echo -ne "Suckless theme manager script\n\n"
echo -ne "Available themes:\n"
echo -e $(ls ~/.suckless/themes/*.conf | sed "s/\/home\/$USER\/.suckless\/themes\///g" | sed s/.conf//g | sort)  '\n' 
echo -n "Choose a theme: "
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
echo -ne "\n\nDo you wish to apply this theme? (y/n) "
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
else
	echo -ne "\nNo new theme applied." && exit
fi
