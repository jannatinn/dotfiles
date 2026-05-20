mkdir -p $HOME/.config

ln -sf "$(pwd)/Brewfile" $HOME/.brewfile
ln -sf "$(pwd)/.zshrc" $HOME/.zshrc
ln -sf "$(pwd)/.zsh_plugins.txt" $HOME/.zsh_plugins.txt
ln -sf "$(pwd)/.abbreviations" $HOME/.abbreviations
ln -sf "$(pwd)/starship.toml" $HOME/.config/starship.toml
ln -sf "$(pwd)/.gitconfig" $HOME/.gitconfig
ln -sf "$(pwd)/.vimrc" $HOME/.vimrc
ln -sf "$(pwd)/nvim" $HOME/.config/nvim
ln -sf "$(pwd)/ghostty" $HOME/.config/ghostty

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew bundle install --file=$HOME/.brewfile &> /dev/null
