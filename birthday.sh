#!/bin/bash

MONTHS=(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)

function birthdayMonth () {
	echo "$((RANDOM%2+92)) $((RANDOM%12+1))"
}

declare -A birthdays

for (( person=1; person<=50; person++ ))
do
	crrBirthdayMonth=$(birthdayMonth)
	if [ -v birthdays["$crrBirthdayMonth"] ]
	then
		birthdayPersons=(${birthdays[$crrBirthdayMonth]})
		birthdayPersons[${#birthdayPersons[@]}]="person$person"
	else
		birthdayPersons=("person$person")
	fi
	birthdays[$crrBirthdayMonth]=${birthdayPersons[@]}
done

for (( year=92; year<=93; year++ ))
do
	for (( month=1; month<=12; month++ ))
	do
		if [ -v birthdays["$year $month"] ]
		then
			tempMonth=(${birthdays["$year $month"]})
			if [ ${#tempMonth[@]} -gt 1 ]
			then
				echo "${tempMonth[@]} have their birthdays in $year ${MONTHS[$(($month-1))]}"
			fi
		fi
	done
done
