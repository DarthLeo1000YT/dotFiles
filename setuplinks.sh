#!/bin/sh
cd "${0%/*}"
echo $(pwd)
unlink $HOME/.zshrc
ln -s $(pwd)/.zshrc $HOME/.zshrc
