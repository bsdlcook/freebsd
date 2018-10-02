# git functions
function git_branch; echo (command git symbolic-ref HEAD ^/dev/null | sed -e "s|^refs/heads/||"); end
function git_repo; echo (command basename (git rev-parse --show-toplevel ^/dev/null)); end
function git_dir; echo (command git rev-parse --show-prefix ^/dev/null); end

function fish_prompt
	set -l delim ">>>"
	set -l host (hostname)
	set -l user (whoami)
	set -l basedir (basename (prompt_pwd))
	
	# colors
	set -l normal (set_color normal)
	set -l red (set_color red)
	set -l cyan (set_color cyan)
	set -l green (set_color green)
	set -l purple (set_color purple)
	set -l blue (set_color blue)
	set -l white (set_color white)

	set -l bred (set_color -o red)
	set -l bcyan (set_color -o cyan)
	set -l bpurple (set_color -o purple)
	set -l bblue (set_color -o blue)
	set -l bgreen (set_color -o green)
	set -l bwhite (set_color -o white)

	# git status
	set -l git ""
	set -l git_branch (git_branch)
	if test -n "$git_branch"
		set -l git_repo (git_repo)
		set -l git_dir (git_dir)
		set git "["$bcyan$git_branch$normal"]" "["$bgreen$git_repo/$git_dir$normal"] "
	end

	# pwd 
	set -l pwd ""
	if test -z "$git"
		set -l home (echo (pwd) | grep ~)
		if test -n "$home"
			set pwd "[$bwhite$basedir$normal] "
		else
			set pwd "[$bwhite/$normal] "
		end
		if test (echo (pwd)) != ~ -a (echo (pwd)) != /
			set pwd "["$bwhite$basedir$normal"] "
		end
	end
	
	# prompt
	echo -esn $bpurple$user$bwhite@$bcyan$host " "$normal$pwd $git $blue$delim" "
end
