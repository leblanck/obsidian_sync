#!/usr/bin/env bash
############################### 
# 
###############################
# Kyle LeBlanc                #
# Last Edit: 3/30/2022        #
###############################

mkdir ~/.local
mkdir ~/.local/bin
mkdir ~/obsidianSync
mkdir ~/obsidianSync/Logs

cp ./obsidianSync.sh ~/.local/bin

crontab -l | { cat; echo "*/30 * * * * ~/.local/bin/obsidianSync.sh >/dev/null 2>&1"; } | crontab -
