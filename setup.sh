ln -sf "$(pwd)/Brewfile" ~/Brewfile
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew bundle --file=$HOME/Brewfile &> /dev/null
