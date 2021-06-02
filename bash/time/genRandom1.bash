#!/bin/bash
# I did store this BASH on this folder because to generate random values I use time functions.
second=`date +%S`;
# To get random characters, I'll relate these variables to a pseudo-ASCII table, for which Ill make arrays.
minus=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "x" "y" "z");
mayus=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "X" "Y" "Z");
#someSymbols=("!" "|" "·" "~" "&" "¬" "(" ")" "=" "<" ">" "*" "-" "_" "," ";" "º" "\");
# Again, Ill use the `count` syntax from the BASH `checkSeconds.bash`:
until [ $second = 60 2>/dev/null ] # second=60 will be conditioned beneath until.
do
	count=`expr $count + 1`
	        if [ $count = 240 2>/dev/null ]
	        then
			genMinus=`expr $genMinus + 1`;
				if [ $genMinus -gt 9 2>/dev/null ]
				then
				genMinus=0;
				fi
genMayus=`expr $genMinus - 1`;
randomMinus=${minus[$genMinus]};
echo $randomMinus;
	        count=0;
	        fi
done
