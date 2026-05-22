setopt CHASE_LINKS

EDITOR=nvim

BREW_PREFIX="/opt/homebrew"
HOMEBREW_NO_ENV_HINTS=true
eval "$($BREW_PREFIX/bin/brew shellenv zsh)"

ABBR_SET_FROM_SOURCE=true
ABBR_USER_ABBREVIATIONS_FILE="$HOME/.abbreviations"
DISABLE_AUTO_TITLE=true
zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
function zvm_after_init() {
    bindkey -M viins " " abbr-expand-and-insert
}
source $BREW_PREFIX/opt/antidote/share/antidote/antidote.zsh
antidote load

PATH="$BREW_PREFIX/opt/llvm/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

eval "$(zoxide init zsh --cmd j)"

eval "$(starship init zsh)"
