#!/bin/bash
# I'll use the "checkSeconds.bash" syntax to schedule the execution of a process.
#
if [ -z $1 2>/dev/null ]
then
echo "You should provide an argument with format: hour:minute . As in the example:"
echo -e "\nprocessSchedule.bash 23:59";echo -e "or\nprocessSchedule.bash 01:05";
else
	setDatetime="$1";
	until [ `date +%H:%M` = $setDatetime 2>/dev/null ]
	do
		count=`expr $count + 1`;
		if [ $count = 240 2>/dev/null ]
		then
		count=0;
		fi
	done
	if [ `date +%H:%M` = $setDatetime 2>/dev/null ]
	then
	echo "Replace this echo for any BASH command.";
	fi
fi
