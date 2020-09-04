#!/bin/bash
# Log programs executed by the user during the day.
#
#This variable stores the current date:
currentDate=$(date +"%b %d %a %y")
#This directory will save all the logs:
mkdir .lgs 2>/dev/null
#There is a directory for each user who runs this program:
mkdir .lgs/${USER} 2>/dev/null
#The log files are .txt files whose name is the current date.
echo >> ./.lgs/${USER}/"$currentDate".txt
#Programs are logged every minute:
echo "At "$(date +%H:%M)": " >> ./.lgs/${USER}/"$currentDate".txt
echo -e "\n" >> ./.lgs/${USER}/"$currentDate".txt
echo $(ps -U ${USER} -o comm=) >> ./.lgs/${USER}/"$currentDate".txt
rm -r ./.lgs/${USER}/.txt 2>/dev/null
#
#You can run this script in background mode and set it to be executed during boot through your System's settings.
#
#By Leandro G.
