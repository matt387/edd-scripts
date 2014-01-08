#!/bin/bash
pwd=/Users/Matt/Desktop/edd
wc -l < $1 | sed -e 's/^[ \t]*//' >> $pwd/columns_v01.txt

