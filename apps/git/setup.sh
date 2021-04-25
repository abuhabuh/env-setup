# Install scripts
# todo: mkdir scripts needs to call an overall env setup workflow that is OS 
# specific
mkdir -p $HOME/scripts

# Install git completion
cp scripts/git-completion.bash $HOME/scripts/

# Install git config
if [ ! -f "$HOME/.gitconfig" ] ; then
  echo "INSTALLING $HOME/.gitconfig"
  cp env-settings/gitconfig $HOME/.gitconfig
else
  echo "INFO: $HOME/.gitconfig exists so skipping install"
fi

