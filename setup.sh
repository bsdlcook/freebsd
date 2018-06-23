#!/usr/bin/env bash
if [ $(id -u) -eq 0 ]; then
	echo "This script shouldn't be run as root, please use a non-privileged user"
	exit
fi

if [ -z $(pkg info -x security/sudo 2>/dev/null | head -n 1) ]; then
	echo -e "Please install sudo by logging in as root and typing:\npkg install sudo\nafter that, you need to type:\necho \"$USER ALL=(ALL) NOPASSWRD: ALL\" >> /usr/local/etc/sudoers\nwhich saves you needing to type out your password each time you need to use sudo; once done re-run this script"
	exit
fi

declare -a packages=(editors/neovim ftp/wget graphics/ImageMagick graphics/feh graphics/zathura graphics/zathura-pdf-mupdf audio/cmus sysutils/tmux sysutils/htop sysutils/py-ranger sysutils/neofetch x11-fonts/terminus-font x11-fonts/nerd-fonts x11/dmenu x11/xorg x11/libX11 x11/libXau x11/libxcb x11/libXdmcp x11/libXext x11/libXinerama devel/libpthread-stubs devel/cmake)

echo "Checking packages..."
for package in ${packages[*]}; do
	echo -ne "[?] $package: "
	if [ -z $(pkg info -x $package 2>/dev/null | head -n 1) ]; then
		echo -ne "Not installed\n"
		sudo pkg install -y $package
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
        sudo make install
        cd ../.. && rm -rf ./fish-shell
        echo -ne "Adding to /etc/shells\n"
        which fish | sudo tee -a /etc/shells
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
	git clone --quiet https://github.com/IBM/plex/ && find ./plex/ -name *Mono*.ttf -exec sudo mv {} /usr/local/share/fonts/TTF/ \; && rm -rf ./plex/
	echo -ne "\nRebuilding font cache...\n"
	fc-cache -fv
else
	echo -ne "Installed\n"
fi

echo -e "\nCopying files to $HOME..."
\cp -fR . ~ &>/dev/null
\rm -rf ~/.{git,gitignore} ~/screenshots/ ~/setup.sh ~/README.md &>/dev/null

echo -e "\nSetting up dbus uuid..."
dbus-uuidgen | sudo tee /etc/machine-id

echo -e "\nCompiling software (dwm,st)..."
sudo make install clean -C ~/.suckless/dwm
sudo make install clean -C ~/.suckless/st
echo -e "\n\nSetup complete! Please reboot your system."
