#!/bin/bash
# Program name: bulkns.sh

#takes one file from arg and outputs to given file in the dir where script is
input="$1"
output=bulkns_output.txt

#clear the output file
> $output

while read x; do 
	echo "Looking up hostname for" $x
	echo $x >> $output
	nslookup $x | tail -2 | awk '{print $2,$3,$4 }' >> $output
	#only show last line and pull out name result
done < $input

