mkdir -p ~/.config

ln -sf "$(pwd)/.brewfile" ~/.brewfile
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.zsh_plugins.txt" ~/.zsh_plugins.txt
ln -sf "$(pwd)/.abbreviations" ~/.abbreviations
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig
ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/nvim" ~/.config/nvim

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew bundle --file=$HOME/.brewfile &> /dev/null
