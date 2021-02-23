if test -z (pgrep ssh-agent | head -n1)
    eval (ssh-agent -c) 1>/dev/null
    eval (ssh-add 2>/dev/null)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    set -Ux GPG_TTY (tty)
end

# General alias'
alias ls=exa
alias vim=nvim

# General environment
set -x fish_greeting
set -x LC_ALL en_GB.UTF-8
set -x LC_CTYPE en_GB.UTF-8
set -x EDITOR nvim
set -x VISUAL nvim
set -x TERM xterm-256color
set -x BROWSER firefox

# Go paths
set -x GOROOT /usr/local/go
set -x GOPATH ~/Development/.go

# Scripts
set -x PATH $PATH ~/.scripts/

function fish_prompt
    set -g yellow (set_color yellow)
    set -g yellow_bold (set_color -o yellow)
    set -g normal (set_color normal)

    set -l last_status $status
    set -l prompt_char \$
    set -l tty (tty | sed 's,\/dev\/,,')

    if [ (id -u) -eq 0 ]
        set prompt_char \#
    end

    if [ $last_status -ne 0 ]
        echo -n "[$yellow_bold$last_status$normal] "
    end

    if test -n "$SSH_CLIENT"
        echo -n "[$yellow_bold"ssh"$normal] "
    end

    echo -e $tty [$yellow(whoami)$normal@(hostname)] $yellow(basename (prompt_pwd))$normal"$prompt_char "
end
