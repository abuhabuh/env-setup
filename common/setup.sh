### Create scripts dir
mkdir -p $HOME/scripts

### Install git config
echo ">> Setting up Git configs"
pushd ../apps/git
./setup.sh
popd

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
