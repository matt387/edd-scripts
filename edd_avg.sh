#!/bin/bash
pwd=/Users/Matt/Desktop/edd

awk '{total+=$1}
END {print total/NR}' $1 >> $pwd/avg.txt
