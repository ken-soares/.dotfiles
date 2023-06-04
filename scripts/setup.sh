#!/bin/sh

homeDirConfigs=(".tmux.conf", ".bashrc")
configDirConfigs=("nvim", "i3", "i3status", "Code")


# vs code key and repository installation
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# install all software
echo "installing software"
sudo dnf install neovim tmux i3 i3status code

echo "downloading plugin managers"
# install tmp for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install packer for nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


# setting up symlinks

# for config files located in home directory
for el in ${homeDirConfigs}; do
    ln -s $HOME/.dotfiles/$el $HOME/
done

# for config files located in .config directory
for el in ${configDirConfigs}; do
    ln -s $HOME/.dotfiles/$el ~/.config
done
