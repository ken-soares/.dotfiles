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

alias "v"="nvim"
alias "sv"="sudo nvim"
alias "la"="ls -la"
alias "ll"="ls -l"
alias "t"="tree -lCaL 2"
alias "m"="ls | grep"
alias "p"="bash ~/.dotfiles/scripts/projects.sh"

# Fancy two-line prompt with git integration
#
# ┌───=[ specious :: sharp -( 0 )-[ ~ ]-( master )
# └──(
#

git_current_head () {                                                                                                          
  git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD                                                      
}                                                                                                                              

git_dirty_mark () {                                                                                                            
  [[ -n $(git status -s | head -c 1) ]] && echo \*
}                                                                                                                              
                                                                                                                               
show_git_prompt () {                                                                                                           
  git branch 2>/dev/null 1>&2 && echo -e "-( \e[34;1m$(git_current_head)$(git_dirty_mark)\e[31;1m )"                           
}

if [[ -n $(type -t git) ]] ; then
  PS1="\$(show_git_prompt)"
else
  PS1=
fi

PS1="
\[\e[31;1m\]┌───=[ \[\e[39;1m\]\u\[\e[31;1m\] (≧ω≦) \[\e[33;1m\]\h\[\e[31;1m\] ]-( \[\e[39;1m\]\j\[\e[31;1m\] )-[ \[\e[39;1m\]\w\[\e[31;1m\] ]$PS1
\[\e[31;1m\]└──( \[\e[0m\]"

# Display running command in GNU Screen window status
#
# In .screenrc, set: shelltitle "( |~"
#
# See: http://aperiodic.net/screen/title_examples#setting_the_title_to_the_name_of_the_running_program
case $TERM in screen*)
  PS1=${PS1}'\[\033k\033\\\]'
esac

source /etc/profile.d/bash_completion.sh
