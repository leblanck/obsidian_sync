#!/usr/bin/env bash
############################### 
# 
###############################
# Kyle LeBlanc                #
# Last Edit: 3/30/2022        #
###############################

#Set Up Variables
vaultPath="~/repos-personal/obsidian_data/"
logPath="~/obsidianSync/Logs/sync.log"

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
    git commit -m "Automated Sync: $(date "+%Y-%m-%d - %H:%M:%S")"

    logAction "Pushing...."
    git push -u origin main

    logAction "Done!"
}

checkChanges() {
    logAction "Checking For Changes in $vaultPath ..."
    cd ~/repos-personal/obsidian_data/
    changes="$(git status --porcelain | wc -l | awk '{print $1}')"
    if [[ "changes" -eq 0 ]]; then
        logAction "No Changes Found; Exiting..."
        exit 0
    else
        logAction "Changes Found! Syncing..."
        syncChanges
    fi
}

logAction "@@@@ START JOB @@@@"
checkChanges