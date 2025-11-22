#!/bin/bash

source ./common.sh

dnf list installed mysql-server &>>$log
validate $? " Mysql available check"

dnf install mysql-server -y &>>$log
validate $? "installing Mysql"

systemctl enable mysqld &>>$log
validate $? "Enabling Mysql"

systemctl start mysqld &>>$log
validate $? "Starting Mysql"

mysql_secure_installation --set-root-pass RoboShop@1
validate $? "Setting password"

Total_time

