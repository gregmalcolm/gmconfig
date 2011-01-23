#!/bin/bash

# MacSetup
#
# Greg's Portable configuration for MacOS. Use it at your own risk!
#
# * Adds this folder to the system as symlink $HOME/config
# * Places .bash_profile and .bashrc in $HOME, thus stopping .profile ever running.
#     * For any computer specific profile settings, place them in ~/.local_profle
# * The script will try to backup all profiles that are in the way (such as ~/bash_profile), copying each file from * to *~.
#   BUT! There is only one round of backups, so run this script twice and you will lose them!

if [ ! "$1" == "force" ]; then
  echo "Are you sure?"
  echo
  echo "This script will replace profiles in your $HOME folder! For example, it"
  echo "will create a new '.bash_profile' and '.bashrc'."
  echo 
  echo "Take a look at the mac_setup.sh script first to make sure you feel"
  echo "confident about this!"
  echo 
  echo "Run './mac_setup.sh force' if you want to run it anyway"
  exit 0
fi


rel_path=`dirname $0`
config_path="$PWD/$rel_path"

echo "Creating ~/config symlink..."
if [ -e ~/config ]; then
  rm ~/config
fi
ln -s $config_path ~/config

if [ -e ~/.bash_profile -a ! -e ~/.bash_profile~ ]; then
  echo "Backing up ~/.bash_profile as ~/.bash_profile~"
  cp ~/.bash_profile ~/.bash_profile~
fi
echo "Creating new '~/.bash_profile'"
cp $config_path/file_drops/.bash_profile ~/.bash_profile 

if [ -e ~/.bashrc -a ! -e ~/.bashrc~ ]; then
  echo "Backing up ~/.bashrc as ~/.bashrc~"
  cp ~/.bashrc ~/.bashrc~
fi
echo "Creating new '~/.bashrc'"
cp $config_path/file_drops/.bashrc ~/.bashrc 

chmod 744 $config_path/scripts
