#!/bin/bash
input=$1
pwd=/Users/Matt/Desktop/edd
tot_lines=$(wc -l < $input)
last_date=$(stat -f %Sm < $input)
echo "Total Lines:" $tot_lines > $pwd/table_v01.txt
ncol=`awk '{print NF}' $input | tail -1`
echo "Total Columns:" $ncol >> $pwd/table_v01.txt 
echo "Date:" $last_date >> $pwd/table_v01.txt
for i in `seq 1 $ncol`;
do
cut -f$i $input | sed '/^$/d' > $pwd/col_$i.txt
done
wait
for i in `ls $pwd/col_*`
do
$pwd/edd_lines.sh $i 
awk '{printf("%s,",$0)}' $pwd/columns_v01.txt > $pwd/columns_v02.txt
done
echo $tot_lines >> $pwd/columns_v02.txt
awk -F, '{for(i=1;i<NF;i++) {print $i/$NF > "/Users/Matt/Desktop/edd/fill_rate.txt"}}' $pwd/columns_v02.txt
awk '{printf("%s,", $0)}' $pwd/fill_rate.txt >> $pwd/columns_v02.txt 
awk -F, '{$NF="";}1' OFS=, $pwd/columns_v02.txt > $pwd/columns_v03.txt
for i in `ls $pwd/col_*`
do
$pwd/edd_uniq.sh $i

 
