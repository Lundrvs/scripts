#!/bin/bash
if [ -z $1 2>/dev/null ]
then
echo -e "Required options: '-d' and '-t'.\n\n\t \"--help\", '-h' or '/?' for help.\n";
fi
#
if [ -n $1 2>/dev/null ]
then
	if [ $1 == '-t' 2>/dev/null ]
	then
	shift;checkTime=$(date --date=$1);app=$2;setTime=$1;
		if [ $? == 0 2>/dev/null ] && [ ${#setTime} == 5 2>/dev/null ]
		then
			until [ `date +%H:%M` == $setTime 2>/dev/null ]
			do
			count=`expr $count + 1`;
				if [ $count == 240 2>/dev/null ]
				then
				count=0;
				fi
			done
			if [ `date +%H:%M` == $setTime 2>/dev/null ]
			then
			$app;
			fi
		else echo "Check help...";
		fi
	fi
	#
	if [ $1 == '-d' 2>/dev/null ]
	then
	shift;setDate=$1;checkDate=$(date --date=$1);
		if [ $? == 0 2>/dev/null ] && [ ${#setDate} == 8 2>/dev/null ]
		then
		shift;setTime=$1;checkTime=$(date --date=$1);app=$2;
			if [ $? == 0 2>/dev/null ] && [ ${#setTime} == 5 2>/dev/null ]
			then
				until [ `date +%Y%m%d` == $setDate 2>/dev/null ] && [ `date +%H:%M` == $setTime 2>/dev/null ]
				do
                        	count=`expr $count + 1`;
                        	        if [ $count == 240 2>/dev/null ]
                        	        then
                        	        count=0;
                        	        fi
				done
				if [ `date +%Y%m%d` == $setDate 2>/dev/null ] && [ `date +%H:%M` == $setTime 2>/dev/null ]
				then
				$app;
				fi
			fi else echo "Check help...";
		fi else echo "Check help...";
	fi
fi
if [ $1 != '-d' 2>/dev/null ] || [ $1 != '-t' 2>/dev/null ] || [ $1 != '--help' 2>/dev/null ] || [ $1 != '/?' 2>/dev/null ] || [ $1 != '-h' 2>/dev/null ]
then
echo "Bad argument.";
fi
#
if [ $1 == '-h' 2>/dev/null ] || [ $1 == '/?' 2>/dev/null ] || [ $1 == '--help' 2>/dev/null ]
then
echo -e "\n\"shedown\" requires certain options in order to work properly.\n";
echo -e "\nUse '-d' to schedule for a specific date.\nUse '-t' to schedule for a specific time.";
echo -e "\n\n-d: shedown -d <date> <hour>:<minute>\n";
echo -e "<date> must be put as a string's number. Per example: 20210101; that is <year><month><day> without spaces.";
echo -e "\n20210101 is the correct syntax and date. But obviously it has to be the date on the future when used on real time...";
echo -e "\nIt can never be as 2021-01-01 or 2021/01/01. Always respect the syntax above."
echo -e "\n\n\n-t: shedown -t <hour>:<minute>\n\tAlways respect the syntax on the time. It has to have 5 and always 5 characters, 4 of which are digits:\n";
echo -e "23:59 has 5 characters 4 of which are digits. But the script reads them as characters. Never skip the symbol ':'.";
echo -e "\n3:5 is a bad synxtax even thought the program \"date\" reads it as \"03:05\".";
echo -e "\nIf (shedown -t <hour>:<minute>) doesn't gets 5 characters it will end in error.";
fi
