#!/bin/bash 
pwd=/Users/Matt/Desktop/edd

uniq -c < $1 | sort | head -1 >> $pwd/mostcommon_v01.txt


