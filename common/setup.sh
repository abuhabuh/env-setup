### Install scripts
mkdir -p $HOME/scripts
cp scripts/git-completion.bash $HOME/scripts/


### Install git config
if [ ! -f "$HOME/.gitconfig" ] ; then
  echo "INSTALLING $HOME/.gitconfig"
  cp env_settings/gitconfig $HOME/.gitconfig
else
  echo "INFO: $HOME/.gitconfig exists so skipping install"
fi


### Install vi settings
if [ ! -f "$HOME/.exrc" ] ; then
  echo "INSTALLING $HOME/.exrc"
  cp env_settings/exrc $HOME/.exrc
else
  echo "INFO: $HOME/.exrc exists so skipping install"
fi


### Install bash addon to bashrc or bash_profile scripts
BASH_FILE="$HOME/.bash_profile"
if [ -f $HOME/.bashrc ]; then
	BASH_FILE="$HOME/.bashrc"
fi
if [ ! -f $BASH_FILE ]; then
	echo "INSTALL: ~/.bash_profile"
	cp scripts/bash_profile $BASH_FILE
fi
cp env_settings/bash_addon $HOME/.bash_addon
cp env_settings/bash_ssh $HOME/.bash_ssh

if grep -q bash_addon $BASH_FILE; then 
	echo "INFO: bash init already has addon trigger"
else
	echo "INFO: bash init installing addon trigger"
  echo "source ~/.bash_addon" >> $BASH_FILE
fi
if grep -q bash_ssh $BASH_FILE; then 
	echo "INFO: bash init already has ssh trigger"
else
	echo "INFO: bash init installing ssh trigger"
  echo "source ~/.bash_ssh" >> $BASH_FILE
fi
