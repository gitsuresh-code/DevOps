#!/bin/bash
user=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

file="/var/log/script/"
name=$( echo $0 | cut -d "." -f1 )
logfile=$file/$name.log

mkdir -p $file

if [ $user -ne 0 ]; then
    echo -e "$R User is not root, please take the root permission $N" | tee -a $logfile
    exit 1
fi

validate ()
{
if [ $? -ne 0 ]; then
    echo -e "$2 package is $R not installed ERROR $N" | tee -a $logfile
    else
    echo -e "$2 package is $G successfully installed $N" | tee -a $logfile
fi
}

dnf list installed nginx &>>$logfile
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? nginx
    else
    echo -e "$1 package is already installed....$Y skipping $N" | tee -a $logfile
fi

dnf list installed python3 &>>$logfile
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? python
    else
    echo -e "$1 package is already installed....$Y skipping $N" | tee -a $logfile
fi

dnf list installed nodejs &>>$logfile
if [ $? -ne 0 ]; then
    dnf install nodejs -y
    validate $? nodejs
    else
    echo -e "$1 package is already installed....$Y skipping $N" | tee -a $logfile
fi

dnf list installed mysql &>>$logfile
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? mysql
    else
    echo -e "$1 package is already installed....$Y skipping $N" | tee -a $logfile
fi