status --is-login; if test -z "$DISPLAY"; exec startx; end

set -x fish_greeting
set -x LC_ALL en_GB.UTF-8
set -x PATH $PATH ~/.scripts/
set -x BROWSER firefox
set -x EDITOR nvim
set -x VISUAL nvim
set -x TERM xterm-256color
