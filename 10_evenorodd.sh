#!/bin/bash
echo "Please enter the number"
read number
rem=$(($number%2))
if [ $rem -eq 0 ]; then
echo "entered Number:$number is even"
else
echo "entered Number:$number is odd"
fi


