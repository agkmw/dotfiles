# dotfiles

Managed with a bare Git repo. Tracked configs live in `$HOME` and `~/.config/`.

## What's inside

- **Neovim** — `~/.config/nvim/` (lazy.nvim, Catppuccin Mocha)
- **Tmux** — `~/.config/tmux/` + `~/.tmux.conf` (TPM, Catppuccin status bar)
- **Zsh** — `~/.zshrc` (Antidote, zoxide, fzf, starship)
- **Git** — `~/.gitconfig`

## Highlights

- **Neovim** bootstraps [lazy.nvim](https://github.com/folke/lazy.nvim) automatically. 27 plugin specs under `lua/plugins/`. Transparent Catppuccin Mocha theme.
- **Tmux** uses [TPM](https://github.com/tmux-plugins/tpm) with a heavily customized Catppuccin status bar (CPU, memory, battery, command icons). Prefix is `C-space`; vim-style pane navigation.
- **Zsh** is driven by [Antidote](https://getantidote.github.io/) with completions, `fzf-tab` previews, `zoxide` `cd` replacement, and `starship` prompt.

## Install

```sh
git clone --bare <repo-url> $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

The `dotfiles` alias is also defined in `.zshrc` (line 45). After checkout, restart your shell or `source ~/.zshrc`.
