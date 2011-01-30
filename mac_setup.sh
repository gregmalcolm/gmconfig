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

backup()
{
  file="$1"
  backup_file="$file~"

  if [ -e ~/$file -a ! -e ~/$backup_file ]; then
    echo "* Backing up ~/$file as ~/$backup_file"
    cp -a ~/$file ~/$backup_file
  fi
}

copy_file()
{
  file="$1"

  backup $file
  
  echo "* Creating new '~/$file'"
  cp $config_path/$file ~/$file 
}

full_link()
{
  source_path="$1"
  target_link="$2"

  backup $target_link

  echo "* Creating ~/$target_link symlink"
  if [ -e ~/$target_link ]; then
    rm ~/$target_link
  fi
  ln -s $config_path/$source_path ~/$target_link
}

link_to_config()
{
  file="$1"

  full_link $file $file  
}

###############################################

echo
echo "Setting up unix configurations..."
echo

rel_path=`dirname $0`
config_path="$PWD/$rel_path"


if [ "$config_path" != "$HOME/config/." ]; then
  full_link . config
fi

copy_file .bash_profile
copy_file .bashrc

echo

link_to_config .irbrc
link_to_config .gitconfig

chmod 744 $config_path/scripts
