# Idempotent
# Setup common components first
(cd ../common; ./setup.sh)

# key repeat in apps - RESTART needed
defaults write -g ApplePressAndHoldEnabled -bool false
