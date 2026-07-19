# ricing

Themes live here as `<name>.zsh` (prompt) and `<name>.tmux.conf` (tmux styling).

A machine picks a theme with two symlinks:

    ln -sf ~/.dotfiles/ricing/purple.zsh       ~/.config/ricing.zsh
    ln -sf ~/.dotfiles/ricing/purple.tmux.conf ~/.config/ricing.tmux.conf

`.zshrc` sources `~/.config/ricing.zsh` and `.tmux.conf` sources
`~/.config/ricing.tmux.conf` when present; with no symlinks they fall back to
their defaults.

- New theme: add `ricing/<name>.zsh` and/or `ricing/<name>.tmux.conf`.
- Switch theme: repoint the symlinks and reload (`source ~/.zshrc`, `tmux source-file ~/.tmux.conf`).
