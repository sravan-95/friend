#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];then
echo "please run the script with root access"
exit 1
fi  

echo "installing mysql"
dnf install mysql -y

if [ $? -ne 0 ]; then
echo "mysql installation failed"
exit 1

else 
echo "installling mysql is successful"
fi