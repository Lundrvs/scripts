#!bin/bash
# Gotten from https://stackoverflow.com/questions/32107041/how-to-check-if-a-string-only-contains-digits-numerical-characters
if [[ $1 =~ ^[0-9]+$ ]]
then
echo "ok"
else echo "ko"
fi;
