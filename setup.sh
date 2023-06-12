#setup symlinks
ln -s ~/.dotfiles/.config/ ~/
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig   
ln -s ~/.dotfiles/.zshrc ~/.zshrc 

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#ensure brew is up to date
brew update
brew upgrade

# install up to date version of git
brew install git

# install iTerm2 
brew install --cask iterm2

# Install Fish shell
brew install fish

# Set Fish shell as the default shell
sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

# Install Tmux
brew install tmux

# Install Neovim
brew install neovim

# Configure Fish shell
echo "# Set the PATH environment variable
set -gx PATH /usr/local/bin \$PATH

# Set Neovim as the default editor
set -gx EDITOR nvim" > ~/.config/fish/config.fish

# Restart Fish shell
exec fish

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
