#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOTFILES_PATH="${HOME}/.config/dotfiles"

# Make sure the config directory exists
mkdir -p $HOME/.config

# install homebrew, if it isn't already
test -d /opt/homebrew > /dev/null 2>&1 || /bin/bash -c "$(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh")"

# install Brewfile
eval "/opt/homebrew/bin/brew bundle --verbose"

echo "Setup configs..."
ln -fs $DOTFILES_PATH/vim ~/.vim
ln -fs $DOTFILES_PATH/git/.gitattributes ~/.gitattributes
ln -fs $DOTFILES_PATH/git/.gitconfig ~/.gitconfig
ln -fs $DOTFILES_PATH/git/.gitignore ~/.gitignore

echo "Add Shell RC files..."
if [[ $SHELL == "/bin/bash" ]]; then
  echo "export DOTFILES_PATH=$DOTFILES_PATH" >> ~/.bashrc
  echo "source $DOTFILES_PATH/shell/profile" >> ~/.bashrc
else
  echo "export DOTFILES_PATH=$DOTFILES_PATH" >> ~/.zshrc
  echo "source $DOTFILES_PATH/shell/zshrc" >> ~/.zshrc
fi

# Update vim plugins
git submodule update --init --recursive
