#!/bin/bash
source ./common.sh

dnf module disable nginx -y &>>$log
validate $? "Disabling default NGINX"

dnf module enable nginx:1.24 -y &>>$log
validate $? "Enabling NGINX 20 version"

dnf install nginx -y &>>$log
validate $? "Installing NGINX"

systemctl enable nginx &>>$log
validate $? "Enabling NGINX"

systemctl start nginx &>>$log
validate $? "Starting NGINX"

cd /usr/share/nginx/html/ &>>$log
validate $? "Switching to NGINX HTML Directory"

rm -rf * &>>$log
validate $? "Delete default NGINX files"

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>$log
validate $? "Downloading front files to temp"   

unzip /tmp/frontend.zip &>>$log
validate $? "Unzipping files to NGINX directory"

cp /root/Roboshop_Common/nginx.conf /etc/nginx/nginx.conf &>>$log
validate $? "Updating nginx config file"

systemctl restart nginx &>>$log
validate $? "Restarting nginx server"

Total_time
