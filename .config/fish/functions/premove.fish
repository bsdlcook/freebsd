function premove
	if test (count $argv) -gt 0
		set -l package /usr/ports/$argv[1]
		if test (pkg info | grep $argv[1] | wc -l | tr -d ' ') && test -d $package
			sudo make -C $package deinstall
			echo "'$argv[1]' successfully removed"
		else
			echo "No package matching '$argv[1]'"
		end
	else
		echo "Usage: premove [group/package]"
	end
end

