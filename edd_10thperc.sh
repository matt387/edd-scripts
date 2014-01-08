#comment
#!/bin/bash
pwd=/Users/Matt/Desktop/edd

awk '{s[NR-1]=$1}
END {print s[int(NR*0.01-0.5)]}' $1 >> $pwd/perc.txt
