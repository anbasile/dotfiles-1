#!/bin/sh

# Install all the necessary Debian packages, especially `stow`.
./install_debian_packages.sh
./configure_services.sh

stow --dotfiles bash
stow --dotfiles emacs
stow --dotfiles email
stow --dotfiles firefox
stow --dotfiles git
stow --dotfiles lisp
stow --dotfiles music
stow --dotfiles ruby
stow --dotfiles x-windows

# Link ~/.bash_profile -> ~/.bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile

# Many of the tools in this repo are written in Ruby, and some depend on
# external libraries. This installs those.
./install_ruby_gems.sh

# Similarly, we use a couple of Python packages.
./install_python_packages.sh
