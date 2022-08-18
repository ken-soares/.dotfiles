# .dotfiles
my config files


Config files you will find here:

| software | in use     |
|----------|------------|
| emacs    | primary    |
| neovim   | secondary  |
| openbox  | primary    |
| kitty    | primary    |
| fish     | primary    |
| i3wm     | not in use |
| i3status | not in use |
| tint2    | primary    |

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
