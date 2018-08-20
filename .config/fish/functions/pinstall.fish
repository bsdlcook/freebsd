function pinstall
	if test (count $argv) -gt 0
		set -l package /usr/ports/$argv[1]
		if test (pkg search -o $argv[1] | wc -l | tr -d ' ') -gt 0 && test -d $package
			if test $argv[2] = "-s" 2>/dev/null || test $argv[2] = "--source" 2>/dev/null
				doas make -C $package install clean BATCH=yes
				echo "'$argv[1]' successfully installed from source"
			else
				doas pkg install $argv[1]
				echo "'$argv[1]' successfully installed"
			end
		else
			echo "No package matching '$argv[1]'"
		end
	else
		echo "Usage: pinstall [group/package] [--source/-s]"
	end
end
