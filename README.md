<h1><b>.dotfiles🔥</b></h1>

my config files

Config files you will find here:

- bash
- tmux
- neovim
- vs code
- i3 and i3status

## setup

### manual

prerequisites:

- git
- the software which uses the config

example with neovim on Fedora Linux

```bash
sudo dnf install neovim
cd ~
git clone https://github.com/ken-soares/.dotfiles.git
ln -s ~/.dotfiles/nvim ~/.config
```

### auto

Default uses Fedora Linux's dnf package manager

```bash
git clone https://github.com/ken-soares/.dotfiles.git
chmod +x .dotfiles/scripts/setup.sh
./.dotfiles/scripts/setup.sh
```
