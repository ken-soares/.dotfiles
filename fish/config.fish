#!/usr/bin/fish

function fish_greeting
	echo “This is the magic item that suppresses my mighty magical powers.\nIf I were ever to take this off, a great catastrophe would surely befall this world…\nWell, that was a lie. I just wear it for looks.”
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end

#aliases
alias ll "exa -l -g --icons"
alias la "ll -a"
alias v "nvim"
alias sv "sudo nvim"

set -gx TERM xterm-256color
eval "$(starship init fish)"
