#!/bin/bash
# Installs programs for MacOS

# NOTE: don't install common components script because macos
#   does not have apt-get

### macos cmds

HOMEBREW=(
	brew
	homebrew
	'/usr/bin/ruby -e "$(curl -fssl https://raw.githubusercontent.com/homebrew/install/master/install)" < /dev/null'
	)
PIP=(
	pip
	pip
	'sudo easy_install pip'
	)
MKVIRTUALENV=(
	mkvirtualenv
	mkvirtualenv
	'pip install virtualenvwrapper'
)
VAGRANT=(
	vagrant
	vagrant
	'brew cask install vagrant'
	)
VBOX=(
	vboxmanage
	virtualbox
	'brew cask install virtualbox'
	)

# programs installed in order
PROGRAMS_LIST=(
	HOMEBREW
	VBOX
	VAGRANT
	PIP
	MKVIRTUALENV
)


# Main install loop

for ITEM in "${PROGRAMS_LIST[@]}"
do
	INTERIM="${ITEM}[@]"
	ARRAYS=( "${!INTERIM}" )
	APP=${ARRAYS[0]}
	APP_PRETTY=${ARRAYS[1]}
	APP_CMD=${ARRAYS[2]}

	if [[ ! `which $APP` ]]; then
		echo "*** info: installing $APP_PRETTY"
		$APP_CMD
	else
		echo "*** info: $APP_PRETTY is already installed"
	fi
done
