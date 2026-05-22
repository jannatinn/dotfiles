mkdir -p $HOME/.config

ln -sf "$(pwd)/Brewfile" $HOME/.brewfile
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew bundle install --file=$HOME/.brewfile &> /dev/null

ln -sf "$(pwd)/starship.toml" $HOME/.config/starship.toml
ln -sf "$(pwd)/.zsh_plugins.txt" $HOME/.zsh_plugins.txt
ln -sf "$(pwd)/.zshrc" $HOME/.zshrc
ln -sf "$(pwd)/.abbreviations" $HOME/.abbreviations

ln -sf "$(pwd)/.gitconfig" $HOME/.gitconfig
ln -sf "$(pwd)/.gitignore" $HOME/.gitignore

ln -sf "$(pwd)/ghostty" $HOME/.config/
ln -sf "$(pwd)/nvim" $HOME/.config/
ln -sf "$(pwd)/.tmux.conf" $HOME/.tmux.conf

