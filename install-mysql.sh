#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];then
echo "please run the script with root access"
exit 1
fi  

dnf list installed mysql 
if [ $? -eq 1 ]; then
echo "mysql is not installed"
else
echo "install mysql"
dnf install mysql -y
fi
if [ $? -eq 1 ]; then
echo "install mysql"
else 
echo "mysql installation successful"
fi