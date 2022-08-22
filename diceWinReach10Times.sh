#!/bin/bash

function dice () {
	echo $((RANDOM%6+1))
}

declare -A winings

for (( i=1; i<7; i++ ))
do
	winings[win $i]=0
done

while [ 1 ]
do
	d=$(dice)
	winings[win $d]=$((${winings[win $d]}+1))
	if [ ${winings[win $d]} -eq 10 ]
	then
		maximum=$d
		break
	fi
done

minimum=1
for (( i=1; i<7; i++ ))
do
	if [ ${winings[win $i]} -lt ${winings[win $minimum]} ]
	then
		minimum=$i
	fi
done

echo "$maximum reached maximum times and $minimum was minimum times"




