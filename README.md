# Laporan Resmi SisOP Modul 1 Kelompok IT25

**Anggota kelompok IT25**:
* Fiorenza Adelia Nalle (5027231053)
* Tio Axellino Irin (5027231065)
* Wira Samudra Siregar (5027231041)

#  Tujuan Praktikum Modul 1

# Deskripsi Praktikum Modul 1

Pada Praktikum Modul 1 ini, kami diberikan tugas untuk mengerjakan Soal Shift Modul 1 yang dilaksanakan mulai hari Rabu (20 Maret 2024) setelah sesi lab hingga hari Senin (25 Maret 2024). Berikut adalah pembagian pengerjaan Soal Shift Modul 1:
* Soal 1 yang dikerjakan oleh Wira Samudra Siregar (5027231041)
* Soal 2 yang dikerjakan oleh Tio Axellino Irin (5027231065)
* Soal 3 yang dikerjakan oleh Fiorenza Adelia Nalle (5027231053)
* Soal 4 yang dikerjakan oleh kami bertiga

# Proses dan Hasil Praktikum Modul 1

## Soal 1

### Deskripsi Soal 1

Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk oleh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan.

Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “[Sandbox.csv](https://drive.google.com/file/d/1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0/view)” untuk diberikan ke cipung dan abe

a. Karena Cipung dan Abe baik hati, mereka ingin memberikan hadiah kepada customer yang telah belanja banyak. Tampilkan nama pembeli dengan total sales paling tinggi

b. Karena karena Cipung dan Abe ingin mengefisienkan penjualannya, mereka ingin merencanakan strategi penjualan untuk customer segment yang memiliki profit paling kecil. Tampilkan customer segment yang memiliki profit paling kecil

c. Cipung dan Abe hanya akan membeli stok barang yang menghasilkan profit paling tinggi agar efisien. Tampilkan 3 category yang memiliki total profit paling tinggi 

d. Karena ada seseorang yang lapor kepada Cipung dan Abe bahwa pesanannya tidak kunjung sampai, maka mereka ingin mengecek apakah pesanan itu ada. Cari purchase date dan amount (quantity) dari nama adriaens

### Penyelesaian Soal 1
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

### Penjelasan Soal 1
- Langkah pertama kita menggunakan command untuk mendownload file yang ada disoal sebagai berikut:

        wget 'https://drive.usercontent.google.com/u/0/uc?id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0&export=download' -O Sandbox.csv

Perintah **wget** digunakan untuk mengunduh file dari URL yang diberikan.

Opsi **-O** digunakan untuk menyimpan file yang diunduh dengan nama "**Sandbox.csv**".

- Langkah kedua kita menggunakan command dibawah ini untuk menyortir sesuai bagian A:

        awk -F, '{if(NR>1) {sales[$6]+=$17}} END {for (buyer in sales) print buyer","sales[buyer]}' Sandbox.csv |sort -t',' -k2 -nr | head -n 1

Perintah **awk** digunakan untuk memproses data dari file "Sandbox.csv".

**if(NR>1)** menghilangkan baris pertama (header) dari pemrosesan.

**sales[$6]+=$17** menggukan nilai pada kolom ke-17 (total sales) dan menggunakan kolom ke-6 (nama pembeli).

**print buyer","sales[buyer]** mencetak nama pembeli dan total salesnya

**sort -t',' -k2 -nr** untuk mengurutkan berdasarkan kolom ke-2 (total sales) secara descending.

**head -n 1** mengambil baris pertama dari output, yang merupakan nama pembeli dengan total sales paling tinggi.

- Langkah ketiga kita menggunakan command dibawah ini untuk menyortir sesuai soal bagian B:

        awk -F ',' 'NR>1 {profit[$7]+=$20} END {for (segment in profit) print segment","profit[segment]}' Sandbox.csv | sort -t',' -k2 -nr | head -n 1

Perintah **awk** digunakan untuk memproses data dari file "Sandbox.csv".

**if(NR>1)** menghilangkan baris pertama (header) dari pemrosesan.

**profit[$7]+=$20** menggunakan nilai pada kolom ke-20 (profit) dan menggunakan kolom ke-7 (customer segment).

**print segment","profit[segment]** mencetak customer segment dan total profitnya.

**sort -t',' -k2 -nr** untuk mengurutkan berdasarkan kolom ke-2 (total profit) secara descending.

**head -n 1** mengambil baris pertama dari output, yang merupakan customer segment dengan profit paling kecil.

- Langkah ketiga kita menggunakan command dibawah ini untuk menyortir sesuai soal bagian C:

        awk -F, '{if(NR>1) {profit[$14]+=$20}} END {for (category in profit) print category","profit[category]}' Sandbox.csv | sort -t',' -k2 -nr | head -n 3

Perintah **awk** digunakan untuk memproses data dari file "Sandbox.csv".

**if(NR>1)** menghilangkan baris pertama (header) dari pemrosesan.

**profit[$14]+=$20** menjumlahkan nilai pada kolom ke-20 (profit) dan menggunakan kolom ke-7 (category).

**print category","profit[category]** mencetak category dan total profitnya.

**sort -t',' -k2 -nr** untuk mengurutkan berdasarkan kolom ke-2 (total profit) secara descending.

**head -n 3** mengambil 3 baris pertama dari output, yang merupakan 3 category dengan total profit paling tinggi.

- Langkah keempat kita menggunakan command dibawah ini untuk menyortir sesuai soal bagian D:

        awk -F ',' '$6 ~ /Adriaens/ {print $2","$18}' Sandbox.csv

Perintah **awk** digunakan untuk memproses data dari file "Sandbox.csv".

**$6 ~ /Adriaens/** adalah pola pencarian yang mencari baris dengan kolom ke-6 (nama pembeli) yang mengandung kata "Adriaens".

**{print $2","$18}** mencetak nilai pada kolom ke-2 (purchase date) dan kolom ke-18 (amount/quantity).


### Kendala Pengerjaan Soal 1
- None

### Screenshot Hasil Pengerjaan Soal 1

## Soal 2

### Deskripsi Soal 2

Oppie merupakan seorang peneliti bom atom, ia ingin merekrut banyak peneliti lain untuk mengerjakan proyek bom atom nya, Oppie memiliki racikan bom atom rahasia yang hanya bisa diakses penelitinya yang akan diidentifikasi sebagai user, Oppie juga memiliki admin yang bertugas untuk memanajemen peneliti,  bantulah oppie untuk membuat program yang akan memudahkan tugasnya

a. Buatlah 2 program yaitu login.sh dan register.sh

b. Setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password

![screenshot_soal2_1](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/9a3d6409-688e-46c9-ba7f-4ef7adf55346)

c. Username yang dibuat bebas, namun email bersifat unique. **setiap email yang mengandung kata admin akan dikategorikan menjadi admin** 

d. Karena resep bom atom ini sangat rahasia Oppie ingin password nya memuat keamanan tingkat tinggi

* Password tersebut harus di encrypt menggunakan base64
* Password yang dibuat harus lebih dari 8 karakter
* Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil
* Harus terdapat paling sedikit 1 angka

e. Karena Oppie akan memiliki banyak peneliti dan admin ia berniat untuk menyimpan seluruh data register yang ia lakukan ke dalam folder users file users.txt. Di dalam file tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.

f. Setelah melakukan register, program harus bisa melakukan login. Login hanya perlu dilakukan menggunakan email dan password.

g. Karena peneliti yang di rekrut oleh Oppie banyak yang sudah tua dan pelupa maka Oppie ingin ketika login akan ada pilihan lupa password dan akan keluar pertanyaan keamanan dan ketika dijawab dengan benar bisa memunculkan password

![screenshot_soal2_2](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/908bcee8-a2ca-4209-9431-d6f459b5bdc6)

h. Setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login Oppie ingin agar admin bisa menambah, mengedit (username, pertanyaan keamanan dan jawaban, dan password), dan menghapus user untuk memudahkan kerjanya sebagai admin.

![screenshot_soal2_3](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/dd510e0a-6ffa-4a33-9e80-e2c0b59a1fb2)

i. Ketika admin ingin melakukan edit atau hapus user, maka akan keluar input email untuk identifikasi user yang akan di hapus atau di edit

j. Oppie ingin programnya tercatat dengan baik, maka buatlah agar program bisa mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register.

* **Format:** [date] [type] [message]
* **Type:** REGISTER SUCCESS, REGISTER FAILED, LOGIN SUCCESS, LOGIN FAILED
* **Ex:**

        [23/09/17 13:18:02] [REGISTER SUCCESS] user [username] registered successfully
        [23/09/17 13:22:41] [LOGIN FAILED] ERROR Failed login attempt on user with email [email]

### Penyelesaian Soal 2

### Kendala Pengerjaan Soal 2

### Screenshot Hasil Pengerjaan Soal 2

## Soal 3

### Deskripsi Soal 3

Alyss adalah seorang gamer yang sangat menyukai bermain game Genshin Impact. Karena hobinya, dia ingin mengoleksi foto-foto karakter Genshin Impact. Suatu saat Yanuar memberikannya sebuah [Link](https://drive.google.com/file/d/1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN/view) yang berisi koleksi kumpulan foto karakter dan sebuah clue yang mengarah ke penemuan gambar rahasia. Ternyata setiap nama file telah dienkripsi dengan menggunakan hexadecimal. Karena penasaran dengan apa yang dikatakan Yanuar, Alyss tidak menyerah dan mencoba untuk mengembalikan nama file tersebut kembali seperti semula.

a. Alyss membuat script bernama **awal.sh**, untuk **download** file yang diberikan oleh Yanuar dan **unzip** terhadap file yang telah diunduh dan decode setiap nama file yang terenkripsi dengan hex . Karena pada file **list_character.csv** terdapat data lengkap karakter, Alyss ingin merename setiap file berdasarkan file tersebut. Agar semakin rapi, Alyss mengumpulkan setiap file ke **dalam folder berdasarkan region** tiap karakter

* **Format:** Region - Nama - Elemen - Senjata.jpg

b. Karena tidak mengetahui jumlah pengguna dari tiap senjata yang ada di folder "genshin_character".Alyss berniat untuk menghitung serta **menampilkan jumlah pengguna untuk setiap senjata** yang ada

* **Format:** [Nama Senjata] : [jumlah]

Untuk menghemat penyimpanan. Alyss **menghapus file** - file yang tidak ia gunakan, yaitu **genshin_character.zip, list_character.csv, dan genshin.zip**

c. Namun sampai titik ini Alyss masih belum menemukan clue dari the secret picture yang disinggung oleh Yanuar. Dia berpikir keras untuk menemukan pesan tersembunyi tersebut. Alyss membuat script baru bernama **search.sh** untuk melakukan pengecekan terhadap setiap file **tiap 1 detik**. Pengecekan dilakukan dengan cara meng-**ekstrak sebuah value dari setiap gambar** dengan menggunakan command **steghide**. Dalam setiap gambar tersebut, **terdapat sebuah file txt** yang berisi string. Alyss kemudian mulai melakukan **dekripsi** dengan hex **pada tiap file txt** dan mendapatkan sebuah url. Setelah mendapatkan url yang ia cari, Alyss akan langsung **menghentikan program search.sh** serta **mendownload file** berdasarkan **url** yang didapatkan.

d. Dalam prosesnya, **setiap kali** Alyss melakukan **ekstraksi** dan ternyata hasil ekstraksi **bukan yang ia inginkan**, maka ia akan langsung **menghapus file txt** tersebut. Namun, jika itu merupakan **file txt yang dicari**, maka ia akan **menyimpan hasil dekripsi-nya bukan hasil ekstraksi**. Selain itu juga, Alyss melakukan **pencatatan log** pada file **image.log** untuk setiap pengecekan gambar

* **Format:** [date] [type] [image_path]
* Ex:

        [24/03/20 17:18:19] [NOT FOUND] [image_path]
        [24/03/20 17:18:20] [FOUND] [image_path]

e. Hasil akhir:

* **genshin_character**
* **search.sh**
* **awal.sh**
* **image.log**
* **[filename].txt**
* **[image].jpg**

### Penyelesaian Soal 3

- Script bash awal.sh

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

- Penjelasan

        wget -O genshin.zip "https://drive.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN"
        unzip genshin.zip
        unzip genshin_character.zip
        cd genshin_character
  Pertama-tama kita akan mendownload file genshin.zip dari Google Drive menggunakan wget, lalu mengekstrak file genshin.zip dengan perintah unzip, dan mengekstrak file genshin_character.zip juga menggunakan perintah unzip. Kemudian masuk ke direktori genshin_character menggunakan cd atau change directory.

        for file in *.jpg; do
          new_name=$(echo "$file" | xxd -r -p)
  Disini kita akan menjalankan loop untuk setiap eksistensi file dengan format ".jpg" di dalam direktori genshin_character. Lalu di baris selanjutnya merupakan perintah untuk mengambil nama file, mengonversinya dari format heksadesimal menjadi string menggunakan xxd, dan menyimpan hasilnya dalam variabel new_name. 

          mv "$file" "${new_name}.jpg"
          echo "File $file telah direname menjadi ${new_name}.jpg" 
        done
  Setelah itu mengganti nama file menjadi nama baru yang telah disimpan di variabel new_name. Baris selanjutnya merupakan perintah untuk mencetak pesan yang memberi tahu pengguna bahwa file telah di rename.

        while IFS=',' read -r name region element weapon; do 
          mkdir -p "$region" 
          new_name="${region} - ${name} - ${element} - ${weapon}.jpg"
  Perintah ini adalah loop while yang membaca data dari file CSV bernama "list_character.csv" baris per baris. Lalu dijalankan perintah mkdir untuk membuat direktori dengan nama yang diambil dari variable "region". Selanjutnya kita akan membuat nama baru untuk file menggunakan nilai dari variabel $region, $name, $element, dan $weapon yang dipisahkan oleh tanda '-' dan diakhiri dengan '.jpg'. Nama baru ini disimpan di variable new_name.  

          mv "${name}.jpg" "${region}/${new_name}" 
          echo "File ${name}.jpg telah direname menjadi ${region}/${new_name}" 
        done < "../list_character.csv"
  Setelah itu kita memindahkan file ke dalam direktori yang sesuai dengan nama region dan memberinya dengan nama baru menggunakan command mv. Perintah echo akan mencetak pesan yang memberi tahu pengguna bahwa file telah dipindahkan ke direktori yang sesuai dan file telah di rename.

        cd ..
        awk -F',' 'NR > 1 {senjata[$4]++} END {for (weapon in senjata) print senjata[weapon], weapon}' 'list_character.csv'
  Perintah "cd .." untuk mengembalikan ke direktori sebelumnya. Lalu kita menggunakan awk untuk membaca file "list_character.csv" dan menghitung kemunculan setiap nilai dalam kolom keempat (senjata). Kemudian mencetak jumlahnya dan nama senjata.

        rm genshin_character.zip genshin.zip list_character.csv
  Terakhir, kita menggunakan perintah rm untuk menghapus file yang tidak digunakan, yaitu genshin_character.zip, genshin.zip, dan list_character.csv.


- Script bash search.sh

        #!/bin/bash
  
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

- Penjelasan

        #!/bin/bash
        cd genshin_character
  Perintah ini untuk mengubah direktori kerja saat ini ke dalam direktori genshin_character.

        found=0
  Inisialisasi variabel found dengan nilai 0. Variabel ini digunakan untuk menandai apakah gambar tersembunyi telah ditemukan.

        for region in *; do:
  Loop ini akan berjalan untuk setiap entri dalam direktori saat ini.

        if [ -d "$region" ]; then:
  Perintah ini untuk memeriksa apakah entri saat ini adalah sebuah direktori.

        for file in "$region"/*.jpg; do:
  Loop ini akan berjalan untuk setiap file dengan ekstensi .jpg dalam direktori yang saat ini sedang diproses.

        if [ -f "$file" ]; then:
  Perintah ini untuk memeriksa apakah entri saat ini adalah sebuah file.

        if [[ "$file" == *.jpg ]]; then:
  Perintah ini untuk memeriksa apakah file saat ini memiliki format .jpg.

        steghide extract -sf "$file" -p "" -xf "$file.txt"
  Perintah ini untuk mengekstrak pesan yang tersembunyi dari file gambar menggunakan steghide, yang di dalamnya terdapat output berupa file.txt

        encrypted=$(cat "$file.txt")
        decrypted=$(echo "$encrypted" | base64 -d)
  Variable encrypted akan membaca pesan tersembunyi di dalam file.txt, lalu pesan tersebut didekripsi menggunakan base64 dan disimpan ke dalam variable decrypted.

        if grep -q "http" <<< "$decrypted"; then
            echo "[$(date '+%d/%m/%y %H:%M:%S')] [FOUND] [$file]" >> "image.log"
            wget "$decrypted"
  Perintah ini untuk memeriksa apakah pesan yang didekripsi di dalam variabel decrypted mengandung string "http" atau berupa url. Jika benar, maka akan mencatat pesan ke dalam file log bahwa gambar tersembunyi telah ditemukan disertai dengan tanggal dan waktu. Setelah itu pesan yang berisi URL tersebut akan diunduh.

           cat image.log
           found=1
           exit 0
  Isi file log tadi akan muncul ke terminal. Selanjutnya, perintah 'found' menandai bahwa gambar tersembunyi telah ditemukan, lalu perintah 
'exit 0' untuk menghentikan program search.sh karena gambar berhasil ditemukan.

        else
          echo "[$(date '+%d/%m/%y %H:%M:%S')] [NOT FOUND] [$file]" >> "image.log"
             cat image.log
             rm -f "$file.txt"
  Jika tidak ditemukan URL dalam variable decrypted, maka akan mencatat pesan ke dalam file log bahwa gambar tersembunyi tidak ditemukan disertai dengan tanggal dan waktu. Lalu isi file log tersebut akan ditampilkan ke terminal. Perintah rm -f berfungsi untuk menghapus file.txt yang tidak mengandung string "http" atau bukan merupakan sebuah URL.

        sleep 1
  Perintah ini memberikan jeda satu detik sebelum melanjutkan ke file berikutnya.

  
### Kendala Pengerjaan Soal 3

- Pada saat menjalankan script awal.sh, terbentuk direktori "region" di dalam direktori genshin_character. Hal ini berarti saat membuat direktori region, baris header terbaca sehingga membuat direktori yang bernama "region"
- Penyelesaiannya :

        { read; while IFS=',' read -r name region element weapon; do 
            mkdir -p "$region" 
            new_name="${region} - ${name} - ${element} - ${weapon}.jpg" 
            mv "${name}.jpg" "${region}/${new_name}" 
            echo "File ${name}.jpg telah direname menjadi ${region}/${new_name}" 
        done; } < "../list_character.csv"
  Dengan menambahkan "read;" untuk membaca baris pertama dan mengabaikannya sebelum memulai loop, sehingga direktori yang bernama region tidak dibuat.

- Pada saat menjalankan script search.sh, file image.log dan file gambar tersembunyi berada di folder genshin_character, dan file .txt berada di dalam folder region. Sementara pada soal diminta untuk meletakkan file image.log, file gambar, dan file .txt di folder soal_3. Selain itu file.txt juga masih terdapat format .jpg sehingga formatnya menjadi .jpg.txt.
- Penyelesaiannya :

        #!/bin/bash
        
        dir="/home/fio/soal_3"
        
        cd genshin_character 
        
        found=0
        for region in *; do
          if [ -d "$region" ]; then
            for file in "$region"/*.jpg; do
              if [ -f "$file" ]; then
                  steghide extract -sf "$file" -p "" -xf "$dir/$(basename "$file" .jpg).txt"
                  
                  encrypted=$(cat "$dir/$(basename "$file" .jpg).txt")
                  decrypted=$(echo "$encrypted" | base64 -d)
        
                 if grep -q "http" <<< "$decrypted"; then
                    echo "[$(date '+%d/%m/%y %H:%M:%S')] [FOUND] [$file]" >> "$dir/image.log"
                    wget "$decrypted" -P "$dir"
                    cat "$dir/image.log"
                    found=1
                    exit 0
                  else
                    echo "[$(date '+%d/%m/%y %H:%M:%S')] [NOT FOUND] [$file]" >> "$dir/image.log"
                    cat "$dir/image.log"
                    rm -f "$dir/$(basename "$file" .jpg).txt"
                  fi
              fi
              sleep 1
            done
          fi
        done

        dir="/home/fio/soal_3"
  Ditambahkan inisialisasi variabel dir di awal untuk menunjukkan path direktori /home/fio/soal_3.

        steghide extract -sf "$file" -p "" -xf "$dir/$(basename "$file" .jpg).txt"
  Baris ini mengekstrak file gambar menggunakan steghide dan outputnya yang berupa file txt akan disimpan ke direktori yang telah ditentukan oleh variabel dir. Terdapat juga penambahan "basename "$file" .jpg" untuk menghapus eksistensi format .jpg.

        echo "[$(date '+%d/%m/%y %H:%M:%S')] [FOUND] [$file]" >> "$dir/image.log"
        wget "$decrypted" -P "$dir"
        cat "$dir/image.log"
  Baris ini akan mencatat pesan ke dalam file log bahwa gambar tersembunyi telah ditemukan disertai dengan tanggal dan waktu. File log ini akan disimpan ke direktori yang ditentukan oleh variabel dir. Lalu menggunakan wget untuk mengunduh konten dari URL yang disimpan dalam variabel decrypted ke direktori yang ditentukan oleh variabel dir. Setelah itu perintah cat untuk menampilkan pesan yang tadi telah dicatat di file log ke terminal.

        echo "[$(date '+%d/%m/%y %H:%M:%S')] [NOT FOUND] [$file]" >> "$dir/image.log"
        cat "$dir/image.log"
        rm -f "$dir/$(basename "$file" .jpg).txt"
  Baris ini akan mencatat pesan ke dalam file log bahwa gambar tersembunyi tidak ditemukan disertai dengan tanggal dan waktu. File log ini akan disimpan ke direktori yang ditentukan oleh variabel dir. Setelah itu perintah cat untuk menampilkan pesan yang tadi telah dicatat di file log ke terminal. Perintah rm -f berfungsi untuk menghapus file.txt yang tidak mengandung string "http" atau bukan merupakan sebuah URL.



### Screenshot Hasil Pengerjaan Soal 3
- Sebelum revisi

  Nama file sesuai format dan sesuai dengan region masing masing, namun file gambar tersembunyi, file image.log terdapat di dalam direktori genshin_character 

  <img width="602" alt="Screenshot 2024-03-30 at 17 09 53" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/18514b43-4a84-4c48-abae-7cd7e55d1df6">
  
  File.txt terdapat di dalam direktori region mondstat, dan terdapat direktori kosong bernama region

  <img width="640" alt="Screenshot 2024-03-30 at 17 09 59" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/fc17434e-d379-426b-8ad5-9b1832743aed">

  Output jumlah senjata dan nama senjata

  <img width="135" alt="Screenshot 2024-03-30 at 17 07 23" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/d57dae53-5c20-49cf-a9c3-fa8b86732693">

  File di dalam direktori soal_3 hanya terdapat file awal.sh, file search.sh, dan folder genshin_character

  <img width="490" alt="Screenshot 2024-03-30 at 17 09 16" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/f7f2bcbd-5ef7-424d-af96-ad74bdecd7c9">


- Setelah revisi
  
  Nama file sesuai format dan sesuai dengan region masing masing

  <img width="660" alt="Screenshot 2024-03-30 at 16 53 36" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/a7adca02-645f-4ec3-b20a-06a3feeb018a">
  
  <img width="518" alt="Screenshot 2024-03-30 at 16 49 25" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/cb64f92e-b8a0-49e3-bc63-28fa87893746">

  Output jumlah senjata dan nama senjata

  <img width="240" alt="Screenshot 2024-03-30 at 13 45 48" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/4dd94b93-a732-4dda-8e7f-251d8e15f8fd">

  File-file yang tedapat pada direktori soal_3, file awal.sh, file gambar tersembunyi dengan format jpg, folder genshin_character, file image.log, file txt, dan file search.sh

  <img width="461" alt="Screenshot 2024-03-30 at 13 46 48" src="https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/147926732/566e27b4-a973-4f64-bccb-5665b53091ac">








## Soal 4

### Deskripsi Soal 4

Stitch sangat senang dengan PC di rumahnya. Suatu hari, PC nya secara tiba-tiba nge-freeze 🤯 Tentu saja, Stitch adalah seorang streamer yang harus setiap hari harus bermain game dan streaming.  Akhirnya, dia membawa PC nya ke tukang servis untuk diperbaiki. Setelah selesai diperbaiki, ternyata biaya perbaikan sangat mahal sehingga dia harus menggunakan uang hasil tabungan nya untuk membayarnya. Menurut tukang servis, masalahnya adalah pada CPU dan GPU yang overload karena gaming dan streaming sehingga mengakibatkan freeze pada PC nya. Agar masalah ini tidak terulang kembali, Stitch meminta kamu untuk membuat sebuah program monitoring resource yang tersedia pada komputer.

Buatlah program monitoring resource pada PC kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh <target_path>`. Catat semua metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh <target_path>` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/.

a. Masukkan semua metrics ke dalam suatu file log bernama metrics_{YmdHms}.log. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2024-03-20 15:00:00, maka file log yang akan tergenerate adalah metrics_20240320150000.log. 

b. Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis pada setiap menit. 

c. Kemudian, buat satu script untuk membuat agregasi file log ke satuan jam. Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil agregasi metrics_agg_2024032015.log dengan format metrics_agg_{YmdH}.log 

d. Karena file log bersifat sensitif pastikan semua file log hanya dapat dibaca oleh user pemilik file.

**Note:**

* Nama file untuk script per menit adalah minute_log.sh
* Nama file untuk script agregasi per jam adalah aggregate_minutes_to_hourly_log.sh
* Semua file log terletak di /home/{user}/log
* Semua konfigurasi cron dapat ditaruh di file skrip .sh nya masing-masing dalam bentuk comment

**Berikut adalah contoh isi dari file metrics yang dijalankan tiap menit:** 
mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size 15949,10067,308,588,5573,4974,2047,43,2004,/home/user/coba/,74M

**Berikut adalah contoh isi dari file aggregasi yang dijalankan tiap jam:**
type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size minimum,15949,10067,223,588,5339,4626,2047,43,1995,/home/user/coba/,50M maximum,15949,10387,308,622,5573,4974,2047,52,2004,/home/user/coba/,74M average,15949,10227,265.5,605,5456,4800,2047,47.5,1999.5,/home/user/coba/,62M

### Penyelesaian Soal 4

### Kendala Pengerjaan Soal 4

### Screenshot Hasil Pengerjaan Soal 4

