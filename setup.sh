#!/usr/bin/env bash
############################### 
# 
###############################
# Kyle LeBlanc                #
# Last Edit: 3/30/2022        #
###############################
loggedInUser=$(stat -f %Su /dev/console)

mkdir /Users/$loggedInUser/.local
mkdir /Users/$loggedInUser/.local/bin
mkdir /Users/$loggedInUser/obsidianSync
mkdir /Users/$loggedInUser/obsidianSync/Logs
touch /Users/$loggedInUser/obsidianSync/Logs/sync.log

cp ./obsidianSync.sh /Users/$loggedInUser/.local/bin

crontab -l | { cat; echo "*/30 * * * * ~/.local/bin/obsidianSync.sh >/tmp/stderr.log 2>/tmp/stdout.log"; } | crontab -
