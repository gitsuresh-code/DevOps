#!/bin/bash

file="/etc/yum.repos.d"
repo=$file/mongo.repo

config=("[mongodb-org-7.0]"
"name=MongoDB Repository"
"baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/7.0/x86_64/" 
"enabled=1"
"gpgcheck=0")

touch $repo

echo  "${config[0]}" | tee -a $repo
echo  "${config[1]}" | tee -a $repo
echo  "${config[2]}" | tee -a $repo
echo  "${config[3]}" | tee -a $repo
echo  "${config[4]}" | tee -a $repo

