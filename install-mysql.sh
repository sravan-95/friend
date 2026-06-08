#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/root/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"

if [ $USERID -ne 0 ];then
echo "please run the script with root access"
exit 1
fi  

value(){
    if [ $2 -ne 0 ]; then
      echo "$1 installation failed" | tee -a $LOGS_FILE
      exit 1
      else 
      echo "installing $1 is successful" | tee -a $LOGS_FILE
    fi
}



dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then
  echo "mysql is already installed" | tee -a $LOGS_FILE
  else
      echo "installing mysql"
      dnf install mysql -y &>> $LOGS_FILE
      value mysql $?
fi


dnf list installed nginx &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "nginx is already installed" | tee -a $LOGS_FILE
    else
        echo "installing nginx"
        dnf install nginx -y &>> $LOGS_FILE 
          value nginx $?
fi 


