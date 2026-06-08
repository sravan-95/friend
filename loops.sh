#!/bin/bash
set -e
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

 trap 'echo "error at $LINENO", command: $bash_command"' ERR

if [ $USERID -ne 0 ];then
echo "please run the script with root access"
exit 1
fi  

value(){
    if [ $2 -ne 0 ]; then
      echo -e "$timestamp $1 installation $R failed $N" | tee -a $LOGS_FILE
      exit 1
      else 
      echo -e "$timestamp installing $1 is $G successful $N" | tee -a $LOGS_FILE
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
           echo -e "$timestamp $package is $Y already installed $N" | tee -a $LOGS_FILE 
      fi  
done