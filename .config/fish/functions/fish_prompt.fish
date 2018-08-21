set -g __syl20bnr_display_rprompt 1

function __syl20bnr_git_branch_name -d "Return the current branch name"
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function __syl20bnr_git_repo_name -d "Return the current repository name"
  echo (command basename (git rev-parse --show-toplevel ^/dev/null))
end

function __syl20bnr_git_repo_base -d "Return the current repository name"
  echo (command git rev-parse --show-toplevel ^/dev/null)
end

function __syl20bnr_git_status -d "git status command"
  git status -b -s --ignore-submodules=dirty
end

function __syl20bnr_unpushed_commit_count -d "Return the number of unpushed commits"
  echo $argv[1] | grep -E -o "ahead\ [0-9]+" | awk '{print $2}'
end

function __syl20bnr_unmerged_commit_count -d "Return the number of unmerged commits"
  echo $argv[1] | grep -E -o "behind\ [0-9]+" | awk '{print $2}'
end

alias v nvim
alias vim nvim
alias s ssh

function fish_prompt -d "Write out the left prompt of the syl20bnr theme"
  set -l last_status $status
  set -l basedir_name (basename (prompt_pwd))

  # Init colors
  set -l colcyan   (set_color cyan)
  set -l colbcyan  (set_color -o cyan)
  set -l colgreen  (set_color green)
  set -l colbgreen (set_color -o green)
  set -l colnormal (set_color normal)
  set -l colred    (set_color red)
  set -l colbred   (set_color -o red)
  set -l colwhite  (set_color white)
  set -l colbwhite (set_color -o white)
  
  # Segments
  set -l ps_git ""
  set -l git_branch_name (__syl20bnr_git_branch_name)
  if test -n "$git_branch_name"
    set -l git_repo_name (__syl20bnr_git_repo_name)
    set -l git_info ""
    set -l git_status (__syl20bnr_git_status)
    if echo $git_status | grep ahead > /dev/null
      set git_info "["$colbgreen"↑"(__syl20bnr_unpushed_commit_count $git_status)$colbred"]"
    end
    if echo $git_status | grep behind > /dev/null
      set git_info "$git_info""["$colbred"↓"(__syl20bnr_unmerged_commit_count $git_status)$colbred"]"
    end
    set -l colbranch $colbgreen
    if echo $git_status | grep -E "\s\?\?\s|\sM\s|\sD\s" > /dev/null
      set colbranch $colbred
    end
    set ps_git $colbwhite"git:"$colbred$git_branch_name$git_info$colnormal"*"$colbcyan$git_repo_name
    if test "$basedir_name" != "$git_repo_name"
        set -l basedir_depth (echo (__syl20bnr_git_repo_base) | sed "s/\// /g" | wc -w)
        set ps_git $ps_git$colnormal":"$colbwhite$basedir_name$colnormal
    end
  end

  # pwd
  set -l ps_pwd ""
  if test -z "$ps_git"
    set -l in_home (echo (pwd) | grep ~)
    if test -n "$in_home"
      set ps_pwd $colred"~"
    else
      set ps_pwd $colred"*"
    end
    if test (echo (pwd)) != ~ -a (echo (pwd)) != /
      set ps_pwd $ps_pwd$colred" "$basedir_name
      #set ps_pwd $ps_pwd$colnormal
    end
  end
      
  # vi mode
  set -l ps_vi ""
  if test -n "$vi_mode"
    set ps_vi $colnormal"["$vi_mode$colnormal"]"
  end
  if test "$fish_key_bindings" = "fish_vi_key_bindings" -o "$fish_key_bindings" = "my_fish_key_bindings" 
    switch $fish_bind_mode
      case default
        set ps_vi $colnormal"("$colred"N"$colnormal")"
      case insert
        set ps_vi $colnormal"("$colgreen"I"$colnormal")"
      case visual
        set ps_vi $colnormal"("$colwhite"V"$colnormal")"
    end
  end

  # end of prompt
  set -l ps_end " λ"
  
  # indicator for ranger parent process
  set -l ranger ""
  set -l os (uname)
  if test "$os" = "Darwin"
    if pstree -s ranger | grep (echo %self) | grep -v grep > /dev/null
      set ranger 1
    end
  end
  if test "$os" = "Linux"
    if pstree -p -l | grep "fish("(echo %self)")" | grep 'ranger([0-9]*)' > /dev/null
      set ranger 1
    end
  end
  if test -n "$ranger"
    set ps_end $ps_end$ps_end
  end
  if test $last_status -ne 0 
    set ps_end $colnormal$colbred$ps_end
  else
    set ps_end $colnormal$colgreen$ps_end
  end

  # left Prompt
  echo -n -s $ps_git $ps_pwd $ps_vi $ps_git_dirty $ps_end ' '
end
