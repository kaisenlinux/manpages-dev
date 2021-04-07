#!/usr/bin/env bash

# DESCRIPTION : install asdf manager 
# REQUIREMENTS : sudo (don't run this script with sudo)
# USAGE1 : chmod +x install-asdf.sh && ./install-asdf.sh

# set asdf git url & versions
asdf_git="https://github.com/asdf-vm/asdf.git"
asdf_version="v0.8.0"
# requirements on linux (git or minimal with git-core)
sudo apt install curl git libssl-dev automake autoconf libncurses5-dev make gcc unzip -y

# clone the latest branch via git
git clone $asdf_git ~/.asdf --branch $asdf_version
# add to your shell
read -p "What is your shell, Bash or ZSH ? enter [B or Z]: " my_shell
# add asdf to your shell
if [[ "$my_shell" = "B"||"b" ]]; then
# asdf bash
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
# ending
echo "Installation done"
echo "Enter in your terminal :
asdf plugin-add erlang && asdf plugin-add elixir
asdf install erlang 23.3.1 && asdf install elixir 1.11.4-otp-23
asdf global erlang 23.3.1 && asdf local elixir 1.11.4-otp-23"
exec bash
else
# asdf zsh
echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
# autocompletions or use ohmyzsh : update ~/.zshrc and add plugins asdf
#fpath=(${ASDF_DIR}/completions $fpath)
#autoload -Uz compinit
#compinit
source ~/.zshrc
# ending
echo "Installation done"
echo "Enter in your terminal :
asdf plugin-add erlang && asdf plugin-add elixir
asdf install erlang 23.3.1 && asdf install elixir 1.11.4-otp-23
asdf global erlang 23.3.1 && asdf local elixir 1.11.4-otp-23"
exec zsh
fi

# enter in terminal: asdf
