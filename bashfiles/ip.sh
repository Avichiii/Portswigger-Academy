#!/bin/bash


i=1
count=1
s=254
while true
do	
	if [[ $i -lt 255 ]]
	then
		echo "192.168.0.$i" >> ip.txt 2>/dev/null || exit 1
	
	elif [[ $count -ge 510 ]]
	then
		break
	
	else
		echo  "192.168.1.$(($i-$s))" >> ip.txt 2>/dev/null || exit 1
	fi
		
	let count++
	let i++
	
done
