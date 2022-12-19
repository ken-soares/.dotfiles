# .dotfiles
my config files


Config files you will find here:

| software  | in use     |
|-----------|------------|
| neovim    | primary    |
| kitty     | primary    |
| tmux      | primary    |
| i3wm      | primary    |
| i3status  | primary    |
| bash      | primary    |
| openbox   | secondary  |
| tint2     | secondary  |
| fish      | not in use |
| emacs     | not in use |
| alacritty | not in use |

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
