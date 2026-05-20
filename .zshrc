setopt CHASE_LINKS

alias soz="source $HOME/.zshrc"
alias viz="vi $HOME/.zshrc"

alias vic="vi main.c"
alias crm="clang -std=c23 -Wall -Wextra -Wpedantic -Wshadow -Wconversion -O0 -g -c main.c && clang main.o -o main && rm main.o && (./main; STATUS=$?; rm main; exit $STATUS)"

alias ga="git add"
alias gc="git commit"
alias gac="ga . && gc"
alias gs="git status"
alias gd="git diff"
alias gp="git push -u origin HEAD"
alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
