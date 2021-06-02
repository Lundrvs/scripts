#!/bin/bash
# I counted how many lines did a simple while condition printed to a `date +%S` command for one second (it was 248);
# every 248 lines, a second is printed if you use:
# 							while [ condition ] do date +%S done.
# Then I used this fact to use it in another condition:
#
until [ `date +%S` = 60 ] #This is thought to never end.
do
count=`expr $count + 1`
	if [ $count = 240 2>/dev/null ]
	then
	date +%S;count=0; # Every count of 240, date +%S is run. I ommited some digits because of the delay.
	fi
done
#Now we get every second on the terminal.
