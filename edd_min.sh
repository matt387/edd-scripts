#!/bin/bash
pwd=/Users/Matt/Desktop/edd

sort -n < $1 | head -1 >> $pwd/min.txt

