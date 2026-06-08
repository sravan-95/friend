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


for package in $@
do
   echo "installing $package"
done