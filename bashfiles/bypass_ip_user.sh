#!/bin/bash

FILE="bypass_ip_names.txt"

count=0
repete=0

while [[ $count -lt $((150 / 2)) ]]
do
	for name in $(cat $FILE)
	do
		if [[ $repete -eq 2 ]]
		then
			echo "wiener" >> bypass_ip_usernames.txt
			let repete=0
			continue
		fi
		
		echo "$name" >> bypass_ip_usernames.txt

		let repete++
	done
	let count++
done