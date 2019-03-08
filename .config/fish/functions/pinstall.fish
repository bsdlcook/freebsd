function pinstall
	if test (count $argv) -gt 0
		if test (pkg rquery '%o' $argv[1] | wc -l | tr -d ' ') -gt 0
			if test $argv[2] = "-s" 2>/dev/null || test $argv[2] = "--source" 2>/dev/null
				if test -d /usr/ports
					doas make -C /usr/ports/(pkg rquery '%o' $argv[1]) install clean BATCH=yes
					echo "'$argv[1]' successfully installed from source"
				else
					echo "Error: ports tree not found! Type 'portsnap fetch extract' to install the collection"
				end
			else
				doas pkg install -y $argv[1]
				echo "'$argv[1]' successfully installed"
			end
		else
			echo "No package matching '$argv[1]'"
		end
	else
		echo "Usage: pinstall [group/package] [--source/-s]"
	end
end
