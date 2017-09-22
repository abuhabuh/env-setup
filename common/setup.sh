### Install scripts
mkdir -p $HOME/scripts
cp scripts/git-completion.bash $HOME/scripts/


### Install git config
cp env_settings/.gitconfig $HOME/


### Install vi settings
cp env_settings/.exrc $HOME/


### Install bash addon to bashrc or bash_profile scripts
BASH_FILE="$HOME/.bash_profile"
if [ -f $HOME/.bashrc ]; then
	BASH_FILE="$HOME/.bashrc"
fi
if [ ! -f $BASH_FILE ]; then
	touch $BASH_FILE
fi
cp env_settings/.bash_addon $HOME/

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
if grep -q ssh-agent $BASH_FILE; then 
	echo "INFO: bash init already has ssh-agent"
else
	echo "INFO: bash init installing ssh-agent"
	echo "# starting ssh agent for adding to ssh keychain" >> $BASH_FILE
	echo "eval \$(ssh-agent)" >> $BASH_FILE
	echo "ssh-add ~/.ssh/*" >> $BASH_FILE
fi

