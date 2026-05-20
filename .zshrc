setopt CHASE_LINKS

export PATH="$HOME/.local/bin:$PATH"

alias soz="source $HOME/.zshrc"
alias viz="vi $HOME/.zshrc"

alias vic="vi main.c"
alias crm="clang -std=c23 -Wall -Wextra -Wpedantic -Wshadow -Wconversion -O0 -g -c main.c && clang main.o -o main && rm -f main.o && { ./main; STATUS=\$?; rm -f main; (( STATUS )); }"
alias cfm="clang-format -i -style=\"{BasedOnStyle: LLVM, BreakBeforeBraces: Allman, IndentWidth: 4, KeepEmptyLinesAtTheStartOfBlocks: false}\" main.c"
alias cfrm="cfm && crm"

alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push -u origin HEAD"
alias gac="ga . && gc"
alias gacp="gac && gp"
