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
touch ~/obsidianSync/Logs/sync.log

cp ./obsidianSync.sh ~/.local/bin

crontab -l | { cat; echo "*/30 * * * * ~/.local/bin/obsidianSync.sh >/tmp/stderr.log 2>/tmp/stdout.log"; } | crontab -
