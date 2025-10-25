#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[32m"
N="\e[0m"
user=$(id -u)
file="/var/log/roboshop_common/"
name=$(echo $0 | cut -d "." -f1)
log=$file/$name.log
DIRECT=$PWD
mkdir -p $file


start_time=$(date +%s)

rootcheck()
{
    if [ $user -ne 0 ]; then
        echo -e "$R Please take root permission $N" | tee -a $log
        exit 1
    fi
}

validate()
{
    if [ $? -ne 0 ]; then
        echo -e "$2 $R is FAILURE $N"
        else
        echo -e "$2 $G is SUCCESS $N"
    fi 
}

NODEJS_SETUP()
{
    dnf module disable nodejs -y &>>$log
    validate $? "Disabling default nodejs"

    dnf module enable nodejs:20 -y &>>$log
    validate $? "Enabling nodejs 20 version"

    dnf install nodejs -y &>>$log
    validate $? "Installing nodejs"
}

User_setup()
{
    id roboshop &>>$log
        if [ $? -ne 0 ]; then
            useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop &>>$log
            validate $? "Adding Application user"
            else
            echo "User is already exist"
        fi

    mkdir -p /app &>>$log
    validate $? "Creating App directory"

    rm -rf /app/*
    validate $? "Deleting old files"

curl -o /tmp/$service.zip https://roboshop-artifacts.s3.amazonaws.com/$service-v3.zip &>>$log
validate $? "Dowloading backend files"

cd /app
validate $? "Switching to app directory"

unzip /tmp/$service.zip &>>$log
validate $? "Unzipping the app files"
}

npm_install()
{
npm install &>>$log
validate $? "installing dependency packages"
}

maven_setup()
{
mvn clean package &>>$log
validate $? "Generating Build File"

mv target/shipping-1.0.jar shipping.jar 
validate $? "Moving build file"
}

python_setup()
{
pip3 install -r requirements.txt >>$log

}

dependency_reload()
{
cp /root/Roboshop_Common/$service.service /etc/systemd/system/$service.service
validate $? "Copying $service service file"

systemctl daemon-reload &>>$log
validate $? "Reloading $service service"

systemctl enable $service &>>$log
validate $? "Enabling $service service"


systemctl start $service &>>$log
validate $? "Starting $service service"
}




Total_time()
{
    end_time=$(date +%s)
    total_time=$(($end_time-$start_time))
    echo "script execute in $total_time seconds"
}


mongo_repo()
{
    cp /root/Roboshop_Common/mongo.repo /etc/yum.repos.d/mongo.repo
}

mysql_schema(){
mysql -h mysql.sureshdevops.fun -uroot -pRoboShop@1 < /app/db/schema.sql &>>$log
validate $? "Loading Schema"


mysql -h mysql.sureshdevops.fun -uroot -pRoboShop@1 < /app/db/app-user.sql &>>$log
validate $? "Loading App User data"

mysql -h mysql.sureshdevops.fun -uroot -pRoboShop@1 < /app/db/master-data.sql &>>$log
validate $? "Loading Master data"
}