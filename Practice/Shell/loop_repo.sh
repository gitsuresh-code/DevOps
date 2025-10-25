#!/bin/bash

echo -e "$Y MongoDB Repo Check $N"

dnf list available mongodb
    if [ $? -ne 0 ];then
            echo -e "Package is not available in repo==> $Y Create New repo$N"
            repocreation
        else 
            echo -e "Package is available to install"
    fi
repocreation() {
        repo="/etc/yum.repos.d"
        repofile=$repo/mongo.repo
        touch $repofile
        repoarray=
            (
            "[mongodb-org-7.0]"
            "name=MongoDB Repository"
            "baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/7.0/x86_64/" 
            "enabled=1"
            "gpgcheck=0"
            )
    for i in "${repoarray[@]}";
        do
        echo "${repoarray[i]}" | tee -a $repofile
        done
       
}




