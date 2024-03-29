#!/bin/bash

wget 'https://drive.usercontent.google.com/u/0/uc?id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0&export=download' -O Sandbox.csv

echo "A. Nama pembeli dengan total sales paling tinggi: "
awk -F, '{if(NR>1) {sales[$6]+=$17}} END {for (buyer in sales) print buyer","sales[buyer]}' Sandbox.csv |sort -t',' -k2 -nr | head -n 1

echo "B. Customer segment yang memiliki profit paling kecil: "
awk -F ',' 'NR>1 {profit[$7]+=$20} END {for (segment in profit) print segment","profit[segment]}' Sandbox.csv | sort -t',' -k2 -nr | head -n 1

echo "C. 3 Category yang memiliki total profit paling tinggi: "
awk -F, '{if(NR>1) {profit[$14]+=$20}} END {for (category in profit) print category","profit[category]}' Sandbox.csv | sort -t',' -k2 -nr | head -n 3

echo "D. Purchase date dan amount (quantity) dari nama adriaens: "
awk -F ',' '$6 ~ /Adriaens/ {print $2","$18}' Sandbox.csv
