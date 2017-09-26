# Not calling common install script because it's not conditional
# on Linux distributions yet (uses apt-get)

### Constanst
BASH_ADDON_FILE="$HOME/.bash_addon"


### Install git
if [[ ! -e /usr/bin/git ]]; then
  yum install -y git
  echo "installed git"
else
  echo "git already installed"
fi

### Install rlwrap for sqlplus
if [[ ! -e /usr/bin/rlwrap ]]; then
  mkdir -p ~/installs/rlwrap
  cd ~/installs/rlwrap
  wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  rpm -Uvh epel-release-latest-7.noarch.rpm
  yum install -y rlwrap
  echo "installed rlwrap"
else
  echo "rlwrap already installed"
fi
if [[ -e $BASH_ADDON_FILE ]]; then
  if ! grep -q "rlwrap sqlplus" $BASH_ADDON_FILE; then
    echo "" >> $BASH_ADDON_FILE
    echo "alias rs='rlwrap sqlplus'" >> $BASH_ADDON_FILE
    echo "" >> $BASH_ADDON_FILE
  fi
else
  echo "WARNING: failed to create shortcut - ~/.bash_addon not found"
fi

