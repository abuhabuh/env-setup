### Mac OS: set key press to repeat
defaults write -g ApplePressAndHoldEnabled -bool false

### Git and Github stuff
# Autocomplete
source ~/scripts/git-completion.bash

### Ruby env
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### NPM env
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

### common cmds
alias ls='ls -lhF'
# Set time to display when running 'history' command
HISTTIMEFORMAT="%d/%m/%y %T "

