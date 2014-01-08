#!/bin/bash
input=$1
pwd=/Users/Matt/Desktop/edd
scripts=/Users/Matt/Desktop/edd_scripts
table=/Users/Matt/Desktop/edd/EDD_TABLE.txt
columns=/Users/Matt/Desktop/edd/EDD_COLUMNS.txt
tot_lines=$(wc -l < $input)
last_date=$(stat -f %Sm < $input)
echo "Total Lines:" $tot_lines > $table
ncol=`awk '{print NF}' $input | tail -1`
echo "Total Columns:" $ncol >> $table 
echo "Date:" $last_date >> $table
for i in `seq 1 $ncol`;
do
cut -f$i $input | sed '/^$/d' > $pwd/col_$i.txt
done
wait
for i in `ls $pwd/col_*`
do
$scripts/edd_lines.sh $i 
$scripts/edd_uniq.sh $i
$scripts/edd_mostcom.sh $i
$scripts/edd_min.sh $i
$scripts/edd_max.sh $i
$scripts/edd_avg.sh $i
$scripts/edd_10thperc.sh $i
$scripts/edd_length.sh $i
awk '{printf("%s, ",$0)}' $pwd/lines_v01.txt > $pwd/lines_v02.txt
done
echo $tot_lines >> $pwd/lines_v02.txt
awk '{for(i=1;i<NF;i++) {print $i/$NF > "/Users/Matt/Desktop/edd/fill_rate.txt"}}' $pwd/lines_v02.txt 
awk -F, '{$NF="";}1' OFS=, $pwd/lines_v02.txt > $columns
awk '{printf("%s, ",$0)}' $pwd/fill_rate.txt >> $columns
echo >> $columns
awk '{printf("%s, ",$0)}' $pwd/uniq.txt >> $columns
echo >> $columns
awk '{printf("%s, ",$2)}' $pwd/mostcommon.txt >> $columns
echo >> $columns
awk '{printf("%s, ",$0)}' $pwd/min.txt >> $columns
echo >> $columns
awk '{printf("%s, ",$0)}' $pwd/max.txt >> $columns
echo >> $columns
awk '{printf("%s, ",$0)}' $pwd/avg.txt >> $columns
echo >> $columns
awk '{printf("%s, ",$0)}' $pwd/perc.txt >> $columns
echo >> $columns
awk '{printf("%s, ",$0)}' $pwd/length.txt >> $columns

