#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];then
echo "please run the script with root access"
exit 1
fi  


dnf list installed mysql
if [ $? -eq 0 ]; then
  echo "mysql is already installed"
  else
      echo "installing mysql"
      dnf install mysql -y

      if [ $? -ne 0 ]; then
      echo "mysql installation failed"
      exit 1
      else 
      echo "installing mysql is successful"
      fi
fi