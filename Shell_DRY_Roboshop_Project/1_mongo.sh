#!/bin/bash

source ./common.sh

rootcheck

dnf list installed mongodb-org &>>$log
validate $? "MogoDB Available"

mongo_repo

dnf install mongodb-org -y &>>$log
validate $? "MongoDB installation"

systemctl enable mongod &>>$log
validate $? "MongoDB Enabling"

systemctl start mongod &>>$log
validate $? "MongoDB start"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$log
validate $? "Updating Config file"

systemctl restart mongod &>>$log
validate $? "restarting service"

Total_time

  






