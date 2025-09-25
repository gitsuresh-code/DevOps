#!/bin/bash

#Root User Validation start here
userid=$(id -u)
if [ $userid -ne 0 ]; then
echo "Please take root permission first"
exit 1
else
echo "You have root permission to run the script"
fi
#Root User Validation end here


#<< MySQL installation script here>>
dnf install mysql -y

a=$($?)
if [ $a -e 0 ]; then
echo "script is success with exit status: $a"
exit 1
else
echo "script is not success with exit status: $a"
fi
#<<end here>

#<< nginx installation script here>>
dnf install nginx -y
a=$($?)
if [ $a -e 0 ]; then
echo "script is success with exit status: $a"
exit 1
else
echo "script is not success with exit status: $a"
fi
#<<end here>>

#<< Mongo installation script here>>
dnf install mongodb-mongosh -y
a=$($?)
if [ $a -e 0 ]; then
echo "script is success with exit status: $a"
exit 1
else
echo "script is not success with exit status: $a"
fi
#<<end here>