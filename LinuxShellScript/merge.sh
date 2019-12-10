#!/bin/bash 

for i in $(seq 1763 2018);
do awk -F"," 'BEGIN { OFS = ","} {$4='"$i"'; print}' tem$i.csv > output_tem$i.csv;
done

awk 'FNR > 1' output_tem*.csv | cut -d "," -f 2- | sort -t ',' -k3 -g > allyearstemp.csv
