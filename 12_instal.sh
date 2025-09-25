#!/bin/bash
ruser=$(id -u)

if [ $ruser -eq 0 ]; then
        echo "User is Root, ready to install the script"
            
    else 
        echo "user is not root, please take root permission to install the package"

fi

dnf install mysql -y

if [ $? -eq 0 ]; then

        echo "MySQL installation is success"

    else
        echo "Error in installing the package"

fi


