#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DOTFILES_PATH="${HOME}/.config/dotfiles"

# Make sure the config directory exists
mkdir -p $HOME/.config

if [[ ! -s ${CODESPACES} ]]; then
  ln -fs $SCRIPT_DIR $DOTFILES_PATH
  exit 0 # TEMPORARY DISABLE
fi

# is_dev_environment checks whether the current box is a throwaway dev
# environment, such as a codespace.
function is_dev_environment() {
  ([[ "$(logname)" == "build" ]] || [[ ! -z ${CODESPACES} ]]) && [[ -z "${DOTFILES_FULL_INSTALL}" ]]
}

function brew_installed() {
  local KERNEL=$(uname -s)
  local ARCH=$(uname -p)

  case "${KERNEL}-${ARCH}" in
    Darwin-arm)
      test -d /opt/homebrew
      ;;
    Darwin-i386)
      test -d /usr/local/Homebrew
      ;;
    Linux-*)
      test -d ~/.linuxbrew || test -d /home/linuxbrew/.linuxbrew
      ;;
  esac
}


if [[ ! is_dev_environment ]]; then
  # install homebrew, if it isn't already
  brew_installed > /dev/null 2>&1 || /bin/bash -c "$(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh")"

  # install Brewfile
  eval "$(brew_dir)/bin/brew bundle --verbose"
else
  echo "Installing missing dependencies.."

  sudo apt-get update
  sudo apt-get install -y \
    vim
fi

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
