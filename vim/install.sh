#!/bin/bash
#


### Install vi settings
if [ ! -f "$HOME/.vimrc" ] ; then
  echo "INSTALLING $HOME/.vimrc"
  cp vimrc $HOME/.vimrc
else
  echo "INFO: $HOME/.vimrc exists so skipping install"
fi

