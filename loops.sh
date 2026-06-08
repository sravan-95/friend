#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ];then
echo "please run the script with root access"
exit 1
fi  

value(){
    if [ $2 -ne 0 ]; then
      echo "$timestamp $1 installation failed" | tee -a $LOGS_FILE
      exit 1
      else 
      echo "$timestamp installing $1 is successful" | tee -a $LOGS_FILE
    fi
}


for package in $@
do
   echo "installing $package"
   dnf list installed $package &>> $LOGS_FILE
      if [ $? -ne 0 ]; then
         dnf install $package -y &>> $LOGS_FILE
         value "installing $package" $?
      else  
           echo "$timestamp $package is already installed" | tee -a $LOGS_FILE
      fi  
done