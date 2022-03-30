#!/usr/bin/env bash
############################### 
# 
###############################
# Kyle LeBlanc                #
# Last Edit: 3/30/2022        #
###############################

scriptLoc="~/.local/bin/"

if [ ! -d "~/.local" ]; then
    mkdir "~/.local"
    if [ ! -d "~/.local/bin" ]; then
        mkdir "~/.local/bin"
    fi
fi

cp ./obsidianSync.sh $scriptLoc

crontab -l | { cat; echo "*/30 * * * * ~/.local/bin/obsidianSync.sh >/dev/null 2>&1"; } | crontab -
