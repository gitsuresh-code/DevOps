#!/bin/bash

source ./common.sh
rootcheck

cp /root/Roboshop_Common/rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
validate $? "Copying RabbitMQ repo file"


dnf install rabbitmq-server -y &>>$log
validate $? "Installing RabbitMQ"

systemctl enable rabbitmq-server &>>$log
validate $? "Enabling RabbitMQ"

systemctl start rabbitmq-server &>>$log
validate $? "Starting RabbitMQ"

id roboshop &>>$log
if [ $? -ne 0 ]; then
        rabbitmqctl add_user roboshop roboshop123 &>>$log
        validate $? "Adding Roboshop user"
    else 
        echo "user already exist..$Y skipping $N" | tee -a $log
fi

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$log
validate $? "Granting permission to roboshop user"

