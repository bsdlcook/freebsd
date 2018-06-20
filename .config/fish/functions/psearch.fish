function psearch
	if test (count $argv) -gt 0
		set -l results (pkg search -o $argv[1] | wc -l | tr -d ' ') 
		if test $results -gt 0
  			pkg search -o $argv[1] | awk \
			'BEGIN {
				print "package\t\t\t       description"
				lines = sprintf("%75s", "") 
				gsub(/ /, "-", lines)
				print lines
			}
		
			{
				print substr($0, index($1, $1))
			}

			END {
				print lines
			}'
			echo "$results package(s) found - type pinstall <group/package> to install"
		else
 			echo "No package(s) found for '$argv[1]'"
		end
	else
		echo "Usage: psearch [package]"
	end
end
