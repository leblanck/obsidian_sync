#!/usr/bin/env bash
############################### 
# 
###############################
# Kyle LeBlanc                #
# Last Edit: 3/30/2022        #
###############################

#Set Up Variables
vaultPath="~/repos-personal/obsidian_data/"
logPath="/Library/Logs/obsidianSync.log"

logAction() {
    #Set up logging
	logTime=$(date "+%Y-%m-%d - %H:%M:%S:")
	echo "$logTime" "$1" >> $logPath
}

syncChanges() {
    logAction "Pulling..."
    git pull

    logAction "Adding..."
    git add .

    logAction "Writing fancy commit message..."
    git commit -m "Automated Sync: $(date "+%Y-%m-%d - %H:%M:%S:")"

    logAction "Pusing...."
    git push -u origin main

    logAction "Done!"
}

checkChanges() {
    logAction "Checking For Changes in $vaultPath ..."
    cd "$vaultPath"
    changes="$(git status --porcelain | wc -l)"
    if [ "changes" -eq 0 ]; then
        logAction "No Changes Found; Exiting..."
        exit 0
    else
        logAction "Changes Found! Syncing..."
        syncChanges
    fi
}

checkChanges
