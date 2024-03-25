#!/bin/bash

wget -O genshin.zip "https://drive.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN"
unzip genshin.zip
unzip genshin_character.zip
cd genshin_character

for file in *.jpg; do 
    new_name=$(echo "$file" | xxd -r -p) 
    mv "$file" "${new_name}.jpg" 
    echo "File $file telah direname menjadi ${new_name}.jpg" 
done

while IFS=',' read -r name region element weapon; do 
    mkdir -p "$region" 
    new_name="${region} - ${name} - ${element} - ${weapon}.jpg" 
    mv "${name}.jpg" "${region}/${new_name}" 
    echo "File ${name}.jpg telah direname menjadi ${region}/${new_name}" 
done < "../list_character.csv"

cd ..

awk -F',' 'NR > 1 {senjata[$4]++} END {for (weapon in senjata) print senjata[weapon], weapon}' 'list_character.csv'

rm genshin_character.zip genshin.zip list_character.csv
