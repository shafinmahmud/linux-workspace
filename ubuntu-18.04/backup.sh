#!/bin/bash 
if [ -z "$*" ]; then echo "No home directory"; fi

HOME_DIR=$1
DATE=$(date "+%Y%m%d")

# Creating directory
mkdir -p /home/backup/$DATE

# Dump home directory
sudo tar --exclude='/home/'$HOME_DIR'/.android' \
	 --exclude='/home/'$HOME_DIR'/.bash_logout' \
     --exclude='/home/'$HOME_DIR'/.cache' \
     --exclude='/home/'$HOME_DIR'/.candidate-selections.json' \
     --exclude='/home/'$HOME_DIR'/.config' \
     --exclude='/home/'$HOME_DIR'/.dbus' \
     --exclude='/home/'$HOME_DIR'/.gnome' \
     --exclude='/home/'$HOME_DIR'/.gnupg' \
     --exclude='/home/'$HOME_DIR'/.gradle' \
     --exclude='/home/'$HOME_DIR'/.gvfs' \
     --exclude='/home/'$HOME_DIR'/.ICEauthority' \
     --exclude='/home/'$HOME_DIR'/.IntelliJIdea.*' \
     --exclude='/home/'$HOME_DIR'/.java' \
     --exclude='/home/'$HOME_DIR'/*.log' \
     --exclude='/home/'$HOME_DIR'/.local' \
     --exclude='/home/'$HOME_DIR'/.m2' \
     --exclude='/home/'$HOME_DIR'/.mozilla' \
     --exclude='/home/'$HOME_DIR'/.mysql' \
     --exclude='/home/'$HOME_DIR'/.mysql_history' \
     --exclude='/home/'$HOME_DIR'/.npm' \
     --exclude='/home/'$HOME_DIR'/.nv' \
     --exclude='/home/'$HOME_DIR'/.nvidia-settings-rc' \
     --exclude='/home/'$HOME_DIR'/.pam_environment' \
     --exclude='/home/'$HOME_DIR'/.pki' \
     --exclude='/home/'$HOME_DIR'/.postman' \
     --exclude='/home/'$HOME_DIR'/.profile' \
     --exclude='/home/'$HOME_DIR'/.psensor' \
     --exclude='/home/'$HOME_DIR'/.ssh' \
     --exclude='/home/'$HOME_DIR'/.sudo_as_admin_successful' \
     --exclude='/home/'$HOME_DIR'/.viminfo' \
     --exclude='/home/'$HOME_DIR'/.vscode' \
     --exclude='/home/'$HOME_DIR'/.wget-hsts' \
     --exclude='/home/'$HOME_DIR'/.xinputrc' \
 	 -czvf /home/backup/$DATE/$HOME_DIR.tar.gz /home/$HOME_DIR/*
