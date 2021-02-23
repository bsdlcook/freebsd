setxkbmap -layout gb

xsetroot -solid "#1F1F1F"

xset b off
xset fp rehash
xset r rate 190 35
xset s off

while :
do
	xsetroot -name "$(date +"%R / %a %d %b") / $(hostname)"; sleep 60
done &

exec dwm
