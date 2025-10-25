#!/bin/bash
source ./common.sh
service=shipping

rootcheck
dnf install maven -y &>>$log
validate $? "Instaling Maven"

User_setup
maven_setup
dependency_reload

dnf install mysql -y &>>$log
validate $? "Installing mysql client"

mysql_schema

systemctl restart shipping &>>$log
validate $? "restarting shipping"

Total_time




