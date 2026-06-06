#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];then
echo "please run the script with root access"
exit 1
fi  

value(){
    if [ $2 -ne 0 ]; then
      echo "$1 installation failed"
      exit 1
      else 
      echo "installing $1 is successful"
    fi
}



dnf list installed mysql
if [ $? -eq 0 ]; then
  echo "mysql is already installed"
  else
      echo "installing mysql"
      dnf install mysql -y
      value mysql $?
fi


dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "nginx is already installed"
    else
        echo "installing nginx"
        dnf install nginx -y
          value nginx $?
          echo "nginx is installed successfully"
fi 