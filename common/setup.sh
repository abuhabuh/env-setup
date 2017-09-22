### Install scripts
mkdir -p $HOME/scripts
cp scripts/git-completion.bash $HOME/scripts/


### Install git config
cp env_settings/gitconfig $HOME/.gitconfig


### Install vi settings
cp env_settings/exrc $HOME/.exrc


### Install bash addon to bashrc or bash_profile scripts
BASH_FILE="$HOME/.bash_profile"
if [ -f $HOME/.bashrc ]; then
	BASH_FILE="$HOME/.bashrc"
fi
if [ ! -f $BASH_FILE ]; then
	touch $BASH_FILE
fi
cp env_settings/bash_addon $HOME/.bash_addon
cp env_settings/bash_ssh $HOME/.bash_ssh

if grep -q bash_addon $BASH_FILE; then 
	echo "INFO: bash init already has addon trigger"
else
	echo "INFO: bash init installing addon trigger"
	if [ $BASH_FILE = "$HOME/.bashrc" ]; then
		echo "~/.bash_addon" >> $BASH_FILE
	else
		echo "source ~/.bash_addon" >> $BASH_FILE
	fi
fi
if grep -q bash_ssh $BASH_FILE; then 
	echo "INFO: bash init already has ssh trigger"
else
	echo "INFO: bash init installing ssh trigger"
	if [ $BASH_FILE = "$HOME/.bashrc" ]; then
		echo "~/.bash_ssh" >> $BASH_FILE
	else
		echo "source ~/.bash_ssh" >> $BASH_FILE
	fi
fi
