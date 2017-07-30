# run common setup first
(cd ../common ; ./setup.sh)

# common setup.sh creates a .bash_addon file so append to that
echo "# turn off capslock in favor or ctrl" >> ~/.bash_addon
echo "setxkbmap -layout us -option ctrl:nocaps" >> ~/.bash_addon

