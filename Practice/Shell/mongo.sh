#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

file="/var/log/Suresh/Scripting"
name=$( echo $0 | cut -d "." -f1)
logfile=$file/$name.log
mkdir -p $file

user=$(id -u)
if [ $user -ne 0 ]; then
    echo -e "User is not root, please take $R ROOT permission $N" | tee -a $logfile
    exit 1
fi

#function START HERE...
check(){
if [ $? -ne 0 ]; then
echo -e "$2****$R FAILURE $N****" | tee -a $logfile
else
echo -e "$2****$G SUCCESS $N****" | tee -a $logfile
fi
}
#****function END HERE*****...


cp mongo.repo /etc/yum.repos.d/

dnf install mongodb-org -y &>>$logfile 
check $? "installing mongod"

systemctl enable mongod &>>$logfile
check $? "enabling mongod"

systemctl status mongod &>>$logfile
check $? "Checking status mongod"

systemctl start mongod &>>$logfile
check $? "Starting mongod"





