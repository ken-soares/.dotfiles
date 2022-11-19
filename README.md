# .dotfiles
my config files


Config files you will find here:

| software  | in use     |
|-----------|------------|
| openbox   | primary    |
| neovim    | primary    |
| fish      | primary    |
| alacritty | primary    |
| emacs     | secondary  |
| tint2     | outdated   |
| i3wm      | not in use |
| i3status  | not in use |
| kitty     | not in use |

## setup
### prerequisites
- the piece of software needed
- git

### example with emacs

```bash
cd ~
git clone https://github.com/ken-soares/.dotfiles.git
cd .config
ln -s ~/.dotfiles/.emacs .emacs
```
