#!/bin/bash
pwd=/Users/Matt/Desktop/edd

sort -n < $1 | tail -1 >> $pwd/max.txt

