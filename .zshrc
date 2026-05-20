setopt CHASE_LINKS

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.abbreviations"
export ABBR_SET_FROM_SOURCE=true
source $(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh
FPATH=$(brew --prefix)/share/zsh-abbr:$FPATH

export DISABLE_AUTO_TITLE="true"
zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
function zvm_after_init() {
    bindkey -M viins " " abbr-expand-and-insert
}
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

eval "$(zoxide init zsh --cmd j)"

export PATH="$HOME/.local/bin:$PATH"

alias vi="nvim"
alias ls="eza --icons=always --group-directories-first --across --git"

eval "$(starship init zsh)"
