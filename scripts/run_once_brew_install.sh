#!/bin/sh

BREWFILE="$HOME/.config/brew/Brewfile"

if ! brew list mas >/dev/null 2>&1; then
  brew install mas
fi

brew bundle --file="$BREWFILE"

sudo bash -c 'echo /opt/homebrew/bin/fish >> /etc/shells';
chsh -s /opt/homebrew/bin/fish;

curl https://sh.rustup.rs -sSf | sh
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
ya pkg -a yazi-rs/plugins:full-border
