#!/bin/bash
echo "Please enter the number"
read number
#number=$1

if [ $number -eq 0 ]; then
    echo "entered number is zero"

    elif [ $number -gt 10 ]; then
        echo "entered number is greater than 10"
    
   else 
        echo "entered number is less than 10"
   
fi
