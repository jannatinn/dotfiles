setopt CHASE_LINKS

alias soz="source $HOME/.zshrc"
alias viz="vi $HOME/.zshrc"

alias vic="vi main.c"
alias crm="clang -std=c23 -Wall -Wextra -Wpedantic -Wshadow -Wconversion -O0 -g -c main.c && clang main.o -o main && rm main.o && (./main; STATUS=$?; rm main; exit $STATUS)"

alias ga="git add"
alias gc="git commit"
