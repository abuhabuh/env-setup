### Install scripts
if [ -d "~/scripts" ]; then
  mkdir ~/scripts
fi
cp scripts/git-completion.bash ~/scripts


### Install git config
cp env_settings/.gitconfig ~/


### Install vi settings
cp env_settings/.exrc ~/.exrc
