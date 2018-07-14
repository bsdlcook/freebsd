function psearch
	if test (count $argv) -gt 0
		set -l results (pkg search -o $argv[1] | uniq | wc -l | tr -d ' ') 
		if test $results -gt 0
  			pkg search -o $argv[1] | uniq | awk \
			'BEGIN {
				lines = sprintf("%75s", "") 
				gsub(/ /, "-", lines)
				print lines
				print "package\t\t\t       description"
				print lines
			}
		
			{
				print substr($0, index($1, $1))
			}

			END {
				print lines
			}'
			echo "$results package(s) matched: type pinstall [group/package] to install"
			echo "---------------------------------------------------------------------------"
		else
 			echo "No package(s) matching '$argv[1]'"
		end
	else
		echo "Usage: psearch [package]"
	end
end
