# git functions
function git_branch
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e "s|^refs/heads/||")
end
function git_repo
    echo (command basename (git rev-parse --show-toplevel ^/dev/null))
end
function git_dir
    echo (command git rev-parse --show-prefix ^/dev/null)
end
function git_hash
    echo (command git rev-parse --short HEAD ^/dev/null)
end

function fish_prompt
    # colors
    set -l normal (set_color normal)
    set -l yellow (set_color yellow)
    set -l red (set_color red)
    set -l cyan (set_color cyan)
    set -l green (set_color green)
    set -l purple (set_color purple)
    set -l blue (set_color blue)
    set -l white (set_color white)

    set -l byellow (set_color -o yellow)
    set -l bred (set_color -o red)
    set -l bcyan (set_color -o cyan)
    set -l bpurple (set_color -o purple)
    set -l bblue (set_color -o blue)
    set -l bgreen (set_color -o green)
    set -l bwhite (set_color -o white)

    set -l lgbracket $red"["$normal
    set -l rgbracket $red"]"$normal

    set -l lbracket $red"("$normal
    set -l rbracket $red")"$normal
    set -l delim $bwhite"%"
    set -l basedir (basename (prompt_pwd))

    # git status
    set -l git ""
    set -l git_branch (git_branch)
    if test -n "$git_branch"
        set -l git_repo (git_repo)
        set -l git_dir (git_dir)
        set -l git_hash (git_hash)
        if test -n "$git_hash"
            set git $lbracket$white"git"$rbracket$lgbracket$bgreen$git_branch$normal$white":"$cyan$git_hash$normal$rgbracket
        else
            set git $lbracket$white"git"$rbracket$lbgracket$bgreen$git_branch$normal$rgbracket
        end
    end

    # pwd 
    set -l pwd ""
    set -l user (echo $USER)
    set -l home (pwd | grep ~)
    if test -n "$home"
       	set pwd $purple$basedir$normal
    else
        set pwd $purple"/"$normal
    end
    if test (echo (pwd)) != ~ -a (echo (pwd)) != /
        set pwd $purple$basedir$normal
    end

    # if active ssh session, append to prompt
    if test -n "$SSH_CLIENT"
        echo -esn $bwhite"[ssh] "
    end

    set -l host $lbracket$bpurple$user@$hostname$normal:$pwd$rbracket

    # prompt
    echo -esn "$host $git\n$delim "
end
