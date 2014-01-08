#!/bin/bash
pwd=/Users/Matt/Desktop/edd
uniq < $1 | wc -l | sed -e 's/^[ \t]*//' >> $pwd/uniq_v01.txt

