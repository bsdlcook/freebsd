status --is-login; if test -z "$DISPLAY"; exec startx; end

if test -z (pgrep ssh-agent | head -n1)
   eval (ssh-agent -c) 1>/dev/null
   eval (ssh-add 2>/dev/null)
   set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
   set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

alias ls="exa"
alias sr="doas"

alias gitc="git clone"
alias gitm="git commit -m"
alias gitp="git push -f origin"
alias gita="git add ."
alias gitd="git diff"
alias gitl="git log"
alias gitr="git reflog"
alias gits="git status"

alias pc="pclean"
alias pi="pinstall"
alias prm="premove"
alias pse="psearch"
alias pst="pstats"
alias pupd="pupdate"
alias pupg="pupgrade"

alias ab="ansible"
alias abp="ansible-playbook"
alias abg="ansible-galaxy"

set -x fish_greeting
set -x LC_ALL en_GB.UTF-8
set -x LC_CTYPE en_GB.UTF-8
set -x PATH $PATH ~/.scripts/
set -x BROWSER firefox
set -x EDITOR emacs
set -x VISUAL emacs 
set -x TERM xterm-256color
set -x GOROOT /usr/local/go
set -x GOPATH ~/Development/.go
set -x ANSIBLE_CONFIG ~/.ansible/config/default.cfg

set -Ux GPG_TTY (tty)