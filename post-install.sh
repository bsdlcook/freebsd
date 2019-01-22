#!/usr/bin/env bash

declare -a PACKAGES=(
	shells/fish
	editors/neovim
	misc/vifm
	graphics/ImageMagick7 
	graphics/feh
	graphics/zathura
	graphics/zathura-pdf-mupdf
	audio/cmus
	sysutils/tmux 
	sysutils/htop 
	sysutils/neofetch
	x11-fonts/nerd-fonts
	x11/xorg
	x11/xinit
	x11/libX11
	x11/libXau
	x11/libxcb
	x11/libXdmcp
	x11/libXext
	x11/libXinerama
	devel/dbus
)

banner() {
cat << "EOF"
	       ,        ,
              /(        )`
              \ \___   / |
              /- _  `-/  '
             (/\/ \ \   /\		
             / /   | `    \	
             O O   ) /    |
             `-^--'`<     '
            (_.)  _  )   /
             `.___/`    /
               `-----' /
  <----.     __ / __   \
  <----|====O)))==) \) /====
  <----'    `--' `.__,' \
               |        |    lewis' freebsd post-installation setup script.
                \       /	   ver 1.
           ______( (_  / \______
         ,'  ,-----'   |        \     - gitlab.com/love_lace/freebsd-setup
         `--{__________)        \/    
EOF
}

check_root() {
	printf "\nchecking perms... "
	[ $(id -u) -eq 0 ] && printf "error: please re-run this script as a non-privileged user.\n" && exit 1
	printf "passed.\n"
}

check_doas() {
	printf "checking doas... "
	[ -z $(pkg info -x security/doas 2>/dev/null | head -n1) ] && \
		printf "error: please install doas by typing: 'pkg install security/doas' with a privileged user; after add your user account with the command: echo 'permit nopass your_user as root' | tee -s /usr/local/etc/doas.conf - then re-run the script.\n" && exit  1
	printf "passed.\n"
}

install_packages() {
	printf "\nchecking packages...\n"
	for PACKAGE in ${PACKAGES[*]}; do
		printf "[#] $PACKAGE: "
		if [ -z $(pkg info -x $PACKAGE 2>/dev/null | head -n1) ]; then
			printf "not installed. "
			doas pkg install -y $PACKAGE &>/dev/null
			printf "passed.\n"
		else
			printf "passed.\n"
		fi
	done
}

set_shell() {
	printf "\nchanging default shell...\n"
	chsh -s $(which fish)
}

check_dein() {
	printf "\nchecking dain... "
	if [ ! -d ~/.cache/dein ]; then
		printf "not installed. downloading setup script. "
		fetch -qo - https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.cache/dein &>/dev/null
		printf "passed.\n"
	else
		printf "passed.\n"
	fi
}

dbus_setup() {
	printf "\nsetting up dbus...\nmachine id: "
	dbus-uuidgen | doas tee /etc/machine-id
	doas sysrc dbus_enable="YES"
	doas sysrc hald_enable="YES"
	printf "dbus setup complete.\n"
}

copy_configs() {
	printf "\ncopying configuration files... "
	cp -fR {.config,.scripts,.suckless,.xinitrc,.tmux.conf} ~ &>/dev/null 	
	printf "passed.\n"
}

compile_suckless() {
	printf "\ncompiling suckless software... "
	doas make install clean -C ~/.suckless/dwm &>/dev/null
	doas make install clean -C ~/.suckless/st  &>/dev/null
	doas make install clean -C ~/.suckless/dmenu &>/dev/null
	printf "passed.\n\nsetup complete. please reboot your system.\n\n-lewis"
}

banner
check_root
check_doas
install_packages
set_shell
check_dein
dbus_setup
copy_configs
compile_suckless
