#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH="${HOME}/.config/dotfiles"

# is_dev_environment checks whether the current box is a throwaway dev
# environment, such as a codespace.
function is_dev_environment() {
  ([[ "$(logname)" == "build" ]] || [[ ! -z ${CODESPACES} ]]) && [[ -z "${DOTFILES_FULL_INSTALL}" ]]
}


if [[ ! is_dev_environment ]]; then
  # install homebrew, if it isn't already
  brew_installed > /dev/null 2>&1 || /bin/bash -c "$(curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh")"

  # install Brewfile
  eval "$(brew_dir)/bin/brew bundle --verbose"

  # asdf_plugin_install "ruby"
  # asdf_plugin_install "nodejs"

  # asdf install ruby "${RUBY_VERSION}"
  # asdf global ruby "${RUBY_VERSION}"

else
  sudo apt-get update
  sudo apt-get install -y \
    vim \
    exuberant-ctags
fi

# Setup configs
# TODO: Check the config is not there already!
echo "source $DOTFILES_PATH/vim/vimrc.vim" >> ~/.vimrc

ln -s $DOTFILES_PATH/git/.gitattributes ~/.gitattributes
ln -s $DOTFILES_PATH/git/.gitconfig ~/.gitconfig
ln -s $DOTFILES_PATH/git/.gitignore ~/.gitignore

if [[ $0 == "bash" ]]; then
  echo "export DOTFILES_PATH=$DOTFILES_PATH" >> ~/.bashrc
  echo "source $DOTFILES_PATH/shell/profile" >> ~/.bashrc
else
  echo "export DOTFILES_PATH=$DOTFILES_PATH" >> ~/.zshrc
  echo "source $DOTFILES_PATH/shell/zshrc" >> ~/.zshrc
fi



if [[ ! -s ${CODESPACES} ]]; then
  git config --global --unset url.ssh://git@github.com/.insteadof
  git config --global url.https://github.com/.insteadof=ssh://git@github.com/
fi
