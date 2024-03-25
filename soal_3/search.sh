cd genshin_character 

found=0
for region in *; do
  if [ -d "$region" ]; then
    for file in "$region"/*.jpg; do
      if [ -f "$file" ]; then
        if [[ "$file" == *.jpg ]]; then
          steghide extract -sf "$file" -p "" -xf "$file.txt"

          encrypted=$(cat "$file.txt")
          decrypted=$(echo "$encrypted" | base64 -d)

         if grep -q "http" <<< "$decrypted"; then
            echo "[$(date '+%d/%m/%y %H:%M:%S')] [FOUND] [$file]" >> "image.log"
            wget "$decrypted"
            cat image.log
            found=1
            exit 0
          else
            echo "[$(date '+%d/%m/%y %H:%M:%S')] [NOT FOUND] [$file]" >> "image.log"
            cat image.log
            rm -f "$file.txt"
          fi
        fi
      fi
      sleep 1
    done
  fi
done
