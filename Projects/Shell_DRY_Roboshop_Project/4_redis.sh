#!/bin/bash
source ./common.sh

dnf list installed redis &>>$log
validate $? "Redis Available"

dnf module disable redis -y &>>$log
validate $? "disabling default version"

dnf module enable redis:7 -y &>>$log
validate $? "enabling version"

dnf install redis -y &>>$log
validate $? "Redis Available"

# sed -i -e 's/127.0.0.1/0.0.0.0 -e /protected-mode/c protected-mode no'/etc/redis/redis.conf &>>$log
sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf &>>$log
validate $? "Redis Enabling Public Access"

sed -i '/protected-mode/c protected-mode no' /etc/redis/redis.conf &>>$log
validate $? "Protected Mode off"

systemctl enable redis &>>$log
validate $? "Redis Enabling"

systemctl start redis &>>$log
validate $? "start service"

Total_time




        
  






