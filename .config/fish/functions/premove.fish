function premove
	if test (count $argv) -gt 0
		if test (pkg query '%o' $argv[1] | wc -l | tr -d ' ') -gt 0
			doas pkg remove -y $argv[1]
			echo "'$argv[1]' successfully removed"
		else
			echo "No installed package matching '$argv[1]'"
		end
	else
		echo "Usage: premove [group/package]"
	end
end

