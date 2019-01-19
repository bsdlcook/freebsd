#!/usr/bin/env bash
if [ $(id -u) -eq 0 ]; then
	echo "This script shouldn't be run as root, please use a non-root user" && exit
fi

if [ -z $(pkg info -x security/doas 2>/dev/null | head -n 1) ]; then
	echo 'Please install doas with "pkg install security/doas" with the root account, and add yourself with the command: echo "permit nopass YOUR_USER as root" | tee -a /usr/local/etc/doas.conf' && exit
fi

declare -a packages=(editors/neovim ftp/wget graphics/ImageMagick graphics/feh graphics/zathura graphics/zathura-pdf-mupdf audio/cmus sysutils/tmux sysutils/htop sysutils/py-ranger sysutils/neofetch x11-fonts/terminus-font x11-fonts/nerd-fonts x11/dmenu x11/xorg x11/libX11 x11/libXau x11/libxcb x11/libXdmcp x11/libXext x11/libXinerama devel/libpthread-stubs devel/cmake)

echo "Checking packages..."
for package in ${packages[*]}; do
	echo -ne "[?] $package: "
	if [ -z $(pkg info -x $package 2>/dev/null | head -n 1) ]; then
		echo -ne "Not installed\n"
		doas pkg install -y $package
		#fish -c "pinstall $package --source" # install from source
	else 
		echo -ne "Installed\n"
	fi
done

echo -e "\nChecking for dein..."
echo -ne "[?] dein: "
if [ ! -d ~/.cache/dein ]; then
	echo -ne "Not installed\nDownloading setup script...\n"
	curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ~/.cache/dein &>/dev/null
	echo -ne "dein now installed\n"
else
	echo -ne "Installed\n"
fi

echo -e "\nChecking for fish..."
echo -ne "[?] fish: "
if [ -z $(which fish) ]; then
        echo -ne "Not installed\nDownloading (please wait)..."
        git clone --quiet https://github.com/fish-shell/fish-shell && cd fish-shell
        mkdir build && cd "$_" && cmake -DCMAKE_BUILD_TYPE=Release ..
        doas make install
        cd ../.. && rm -rf ./fish-shell
        echo -ne "Adding to /etc/shells\n"
        which fish | doas tee -a /etc/shells
        echo -ne "Changing default shell (enter password)\n"
        chsh -s $(which fish)
        echo -ne "fish now installed\n"
else
	echo -ne "Installed\n"
fi

echo -e "\nChecking for IBM Plex fonts..."
echo -ne "[?] IBM Plex: "
if [ -z "$(fc-list | grep -i ibmplex)" ]; then
	echo -ne "Not installed\nDownloading (please wait)..."
	git clone --quiet https://github.com/IBM/plex/ && find ./plex/ -name *Mono*.ttf -exec doas mv {} /usr/local/share/fonts/TTF/ \; && rm -rf ./plex/
	echo -ne "\nRebuilding font cache...\n"
	fc-cache -fv
else
	echo -ne "Installed\n"
fi

echo -e "\nCopying files to $HOME..."
\cp -fR . ~ &>/dev/null
\rm -rf ~/.{git,gitignore} ~/screenshots/ ~/setup.sh ~/README.md &>/dev/null

echo -e "\nSetting up dbus uuid..."
dbus-uuidgen | doas tee /etc/machine-id

echo -e "\nCompiling software (dwm,st)..."
doas make install clean -C ~/.suckless/dwm
doas make install clean -C ~/.suckless/st
echo -e "\n\nSetup complete! Please reboot your system."
