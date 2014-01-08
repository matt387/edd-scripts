#!/bin/bash
pwd=/Users/Matt/Desktop/edd

awk '(length > L) {L=length} 
end {print L}' $1 >> $pwd/length.txt

