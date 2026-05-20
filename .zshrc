setopt CHASE_LINKS

alias soz="source $HOME/.zshrc"
alias cmain="clang -std=c23 -Wall -Wextra -Wpedantic -Wshadow -Wconversion -O0 -g -c main.c && clang main.o -o main && rm main.o && ./main"
