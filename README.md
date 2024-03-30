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

### Kendala Pengerjaan Soal 3

### Screenshot Hasil Pengerjaan Soal 3

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

