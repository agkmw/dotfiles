# Antidote setup
source $HOME/.antidote/antidote.zsh
antidote load

# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion caching
zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:git-(add|diff|checkout|restore):*' fzf-preview 'git diff $realpath | delta'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
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
export BAT_THEME='Catppuccin Mocha'
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$(go env GOPATH)/bin"

# Aliases
alias dotfiles="/usr/bin/git --git-dir=\"\$HOME/.dotfiles/\" --work-tree=\"\$HOME\""
alias ff="
    fd . --type f | \
    fzf --header='Open with nvim' \
        --extended --multi --preview 'bat --style=full,-grid --color=always {}' | \
    xargs -ro nvim
"
alias cat="bat"

alias nvim-lazy="NVIM_APPNAME=lazyvim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=nvchad nvim"
alias nvim-astro="NVIM_APPNAME=astronvim nvim"

function nvims() {
    items=("default" "kickstart" "lazyvim" "nvchad" "astronvim")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    elif [[ $config == "default" ]]; then
        config=""
    fi
    NVIM_APPNAME=$config nvim $@
}

# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

if [[ -n "$PS1" && -z "$TMUX" && -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
    tmux new-session "fastfetch; zsh"
fi

# opencode
export PATH=/home/aungkhant/.opencode/bin:$PATH
