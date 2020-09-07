#!/bin/bash
# Log programs executed by the user during the day.
#
#This variable stores the current date:
currentDate=$(date +"%b %d %a %y")
#This directory will save all the logs:
mkdir /home/${USER}/.psDateLog 2>/dev/null
#The log files are .txt files whose name is the current date.
ls /home/${USER}/.psDateLog/"$currentDate".txt 1>/dev/null 1>/dev/null 2>/dev/null
if [ $? != 0 ]
then
echo >> /home/${USER}/.psDateLog/"$currentDate".txt
#Programs are logged every minute:
else
echo " " >> /home/${USER}/.psDateLog/"$currentDate".txt
echo "At "$(date +%H:%M)": " >> /home/${USER}/.psDateLog/"$currentDate".txt
echo -e "\n" >> /home/${USER}/.psDateLog/"$currentDate".txt
echo $(ps -U ${USER} -o comm=) >> /home/${USER}/.psDateLog/"$currentDate".txt
rm -r /home/${USER}/.psDateLog/.txt 2>/dev/null
fi
#
#You can run this script in background mode and set it to be executed during boot and every minute of the day through your System's settings.
#
#By Leandro G.
