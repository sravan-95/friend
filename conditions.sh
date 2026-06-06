#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 30 ]; then
    echo "given number $NUMBER is greater than 30"
elif [ $NUMBER -eq 30 ]; then
    echo "given number $NUMBER is equal to 30"
else
    echo "given number $NUMBER is less than 30"
fi