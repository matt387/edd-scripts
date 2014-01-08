#!/bin/bash
pwd=/Users/Matt/Desktop/edd
wc -l < $1 | sed -e 's/^[ \t]*//' >> $pwd/lines_v01.txt

