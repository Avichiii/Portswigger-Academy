#!/bin/bash

FILE="passwords.txt"

count=0

for name in $(cat $FILE)
do
	if [[ $count -eq 2 ]]
	then
		echo "peter" >> bypass_ip_passwords.txt
		let count=0
	fi

	echo "$name" >> bypass_ip_passwords.txt

	let count++
done