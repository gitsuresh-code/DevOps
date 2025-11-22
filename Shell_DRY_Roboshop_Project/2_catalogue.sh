#!/bin/bash
source ./common.sh
service=catalogue
rootcheck
NODEJS_SETUP
mongo_repo

dnf install mongodb-mongosh -y &>>$log 
validate $? "Installing mongo client"

mongosh --host mongo.sureshdevops.fun </app/db/master-data.js
validate $? "Loading DB Schema"

Total_time