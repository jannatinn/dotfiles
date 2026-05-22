setopt CHASE_LINKS

export EDITOR=nvim

export HOMEBREW_NO_ENV_HINTS=true
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export DISABLE_AUTO_TITLE="true"
zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
function zvm_after_init() {
    bindkey -M viins " " abbr-expand-and-insert
}
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

export ABBR_USER_ABBREVIATIONS_FILE="$HOME/.abbreviations"
export ABBR_SET_FROM_SOURCE=true
source $(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh
FPATH=$(brew --prefix)/share/zsh-abbr:$FPATH

eval "$(zoxide init zsh --cmd j)"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(starship init zsh)"
