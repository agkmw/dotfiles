# Antidote setup
source $HOME/.antidote/antidote.zsh
antidote load

# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=HISTSIZE

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:git-(add|diff|checkout|restore):*' fzf-preview 'git diff $realpath | delta'
zstyle ':fzf-tab:complete:*:*' fzf-preview '
    if [[ -f $realpath ]]; then
        bat -n --color=always --line-range :500 $realpath
    elif [[ -d $realpath ]]; then
        ls -1 --color=always $realpath
    fi
'

# Environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export TZ='Asia/Yangon'

# Aliases
alias "dotfiles"="/usr/bin/git --git-dir=\"\$HOME/.dotfiles/\" --work-tree=\"\$HOME\""

eval "$(starship init zsh)"
