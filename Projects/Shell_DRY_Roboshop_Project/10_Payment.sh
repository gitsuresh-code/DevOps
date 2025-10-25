#!/bin/bash
source ./common.sh
service=payment
rootcheck

dnf install python3 gcc python3-devel -y &>>$log
validate $? "Python3 installation"

User_setup
python_setup
dependency_reload


