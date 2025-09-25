#!/bin/bash

LOGS_FOLDER="/var/log/shell-script" #/var/log/shell-script /
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) #20_logs
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/20_logs.log
echo "$LOGS_FOLDER"
echo "$SCRIPT_NAME"
echo "$LOG_FILE"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

