# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc

# alias list
alias "v"="nvim"
alias "sv"="sudo nvim"
alias "la"="ls -la"
alias "ll"="ls -l"
alias "t"="tree -lCaL 2"
alias "m"="ls | grep"
alias "p"="bash ~/.dotfiles/scripts/projects.sh"
alias "fetch"="echo -e '\n$(bunnyfetch)'"
alias "tk"="tmux kill-session"


# custom prompt
PS1="\n\[\033[1;34m\]\342\226\210\342\226\210 \u @ $SERVER_NAME""$BBlue"" \w""$Color_Off  \n\[\033[0;36m\]\342\226\210\342\226\210 \d \t $ \[\033[0;39m\]"
source /etc/profile.d/bash_completion.sh

# Startup message
echo -e "\n\e[3m\e[1m(´• ω •\`) Please Do Not Throw Salami Pizza Away ♪\e[0m"

