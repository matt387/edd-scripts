#!/bin/bash
input=$1
pwd=/Users/Matt/Desktop/edd
scripts=/Users/Matt/Desktop/edd_scripts
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
$scripts/edd_lines.sh $i 
$scripts/edd_uniq.sh $i
$scripts/edd_mostcom.sh $i
$scripts/edd_min.sh $i
$scripts/edd_max.sh $i
$scripts/edd_avg.sh $i
$scripts/edd_10thperc.sh $i
$scripts/edd_length.sh $i
awk '{printf("%s, ",$0)}' $pwd/columns_v01.txt > $pwd/columns_v02.txt
done
echo $tot_lines >> $pwd/columns_v02.txt
awk '{for(i=1;i<NF;i++) {print $i/$NF > "/Users/Matt/Desktop/edd/fill_rate.txt"}}' $pwd/columns_v02.txt 
awk -F, '{$NF="";}1' OFS=, $pwd/columns_v02.txt > $pwd/columns_v03.txt
awk '{printf("%s, ",$0)}' $pwd/fill_rate.txt >> $pwd/columns_v03.txt
echo >> $pwd/columns_v03.txt
awk '{printf("%s, ",$0)}' $pwd/uniq_v01.txt >> $pwd/columns_v03.txt
echo >> $pwd/columns_v03.txt
awk '{printf("%s, ",$2)}' $pwd/mostcommon_v01.txt >> $pwd/columns_v03.txt
echo >> $pwd/columns_v03.txt
awk '{printf("%s, ",$0)}' $pwd/min_v01.txt >> $pwd/columns_v03.txt
echo >> $pwd/columns_v03.txt
awk '{printf("%s, ",$0)}' $pwd/max.txt >> $pwd/columns_v03.txt
echo >> $pwd/columns_v03.txt
awk '{printf("%s, ",$0)}' $pwd/testing.txt >> $pwd/columns_v03.txt
echo >> $pwd/columns_v03.txt
awk '{printf("%s, ",$0)}' $pwd/perc.txt >> $pwd/columns_v03.txt 
echo >> $pwd/columns_v03.txt
awk '{printf("%s, ",$0)}' $pwd/length.txt >> $pwd/columns_v03.txt

