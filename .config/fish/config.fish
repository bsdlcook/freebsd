status --is-login; if test -z "$DISPLAY"; exec startx; end

alias pc="pclean"
alias pi="pinstall"
alias prm="premove"
alias pse="psearch"
alias pst="pstats"
alias pupd="pupdate"
alias pupg="pupgrade"

set -x fish_greeting
set -x LC_ALL en_GB.UTF-8
set -x PATH $PATH ~/.scripts/
set -x BROWSER firefox
set -x EDITOR nvim
set -x VISUAL nvim
set -x TERM xterm-256color
