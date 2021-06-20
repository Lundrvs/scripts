#!/bin/bash
count=0;
until [ $count == 1000 2>/dev/null ]
do
count=`expr $count + 1`;
	if [ $count = 450 2>/dev/null ]
	then
	count=0;
	date +%T;
	fi
done
