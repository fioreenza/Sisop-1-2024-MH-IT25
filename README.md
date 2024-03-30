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
* Soal 4 yang dikerjakan oleh Tio Axellino Irin (5027231065)

# Proses dan Hasil Praktikum Modul 1

## Soal 1

**Oleh Wira Samudra Siregar (5027231041)**

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

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/145766477/b576c225-338b-4ca0-86a1-78ddd2bd8e48)


## Soal 2

**Oleh Tio Axellino Irin (5027231065)**

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

- **Bash Script Register.sh**

        #!/bin/bash

        log_message()
        {
            local type="$1"
            local message="$2"
            local date_time=$(date +"[%d/%m/%y %H:%M:%S]")
            echo "$date_time [$type] $message" >> auth.log
        }
        echo "Welcome to Registration System"
        while true; do
            echo "Enter your email:"
            read user_email

            contains_substring()
            {
                    [[ $1 == *"$2"* ]]
            }

            validate_email_format()
            {
                    email="$1"
                    if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]
                    then
                            return 0
                    else
                            return 1
                    fi
            }

            if ! validate_email_format "$user_email"
            then
                    log_message "REGISTER FAILED" "ERROR Failed register, the user entered an email with the invalid format: $user_email"
                    echo "Invalid email format. Please enter your email in the correct format."
            elif grep -s -q "^Email: $user_email$" users.txt
            then
                    log_message "REGISTER FAILED" "ERROR Failed register, The user enters the registered email: $user_email"
                    echo "Email $user_email is already registered. Please use another email for registration."
            else
                    break
            fi
        done

        if contains_substring "$user_email" "admin"
        then
                status="Admin"
        else
                status="User"
        fi

        echo "Enter your username:"
        read username

        echo "Enter a security question:"
        read security_question
        echo "Enter the answer to your security question:"
        read security_answer

        while true; do
                read -s -p "Enter a password (minimum 8 characters, at      least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol,        and not same as username, birhtdate, or name): " password
            echo

            if (( ${#password} < 8 ))
            then
                    log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format"
                    echo "The password must consist of a minimum of 8 characters."
            elif ! [[ "$password" =~ [A-Z] ]]
            then
                    log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
                    echo "The password must contain at least 1 uppercase letter."
            elif ! [[ "$password" =~ [a-z] ]]
            then
                    log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
                    echo "The password must contain at least 1 lowercase letter."
            elif ! [[ "$password" =~ [0-9] ]]
            then
                    log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
                    echo "The password must contain at least 1 number."
            else
                    log_message "REGISTER SUCCESS" "user $username as $status registered succesfully"
                    encrypted_password=$(echo -n "$password" | base64)
                    break
            fi
        done

        echo "Email: $email" >> users.txt
        echo "Status: $status" >> users.txt
        echo "Username: $username" >> users.txt
        echo "Security Question: $security_question" >> users.txt
        echo "Security Answer: $security_answer" >> users.txt
        echo "Password: $encrypted_password" >> users.txt
        echo " " >> users.txt

        echo "Users registered succesfully!"

- **Penjelasan**

        log_message()
        {
            local type="$1"
            local message="$2"
            local date_time=$(date +"[%d/%m/%y %H:%M:%S]")
            echo "$date_time [$type] $message" >> auth.log
        }

Fungsi ini digunakan untuk mencatat pesan log dengan format tertentu ke dalam file auth.log. Ini termasuk tipe pesan (seperti "REGISTER FAILED" atau "REGISTER SUCCESS"), waktu dan tanggal, dan pesan itu sendiri.

        while true; do

Memulai loop tak terbatas. Ini berarti bahwa bagian kode di dalamnya akan terus dieksekusi sampai ada instruksi `break` yang menghentikan loop.

        contains_substring()
        {
            [[ $1 == *"$2"* ]]
        }

Fungsi untuk mengecek apakah string mengandung substring tertentu

    validate_email_format()
    {
        email="$1"
        if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]
        then
            return 0 
        else
            return 1  
        fi
    }

Fungsi ini digunakan untuk memvalidasi format alamat email yang dimasukkan pengguna. Ini menggunakan ekspresi reguler untuk memastikan bahwa alamat email sesuai dengan format yang diperlukan. Jika format email valid, fungsi ini mengembalikan nilai 0; jika tidak, mengembalikan nilai 1.

      if ! validate_email_format "$user_email"
      then
              log_message "REGISTER FAILED" "ERROR Failed register, the user entered an email with the invalid format: $user_email"
              echo "Invalid email format. Please enter your email in the correct format."
      elif grep -s -q "^Email: $user_email$" users.txt
      then
              log_message "REGISTER FAILED" "ERROR Failed register, The user enters the registered email: $user_email"
              echo "Email $user_email is already registered. Please use another email for registration."
      else
              break
      fi

Validasi format email dilakukan dengan menggunakan fungsi `validate_email_format "$user_email"`. Jika alamat email tidak valid, skrip mencatat pesan kesalahan ke dalam log dan memberi tahu pengguna bahwa alamat email yang dimasukkan tidak sesuai format.

Setelah validasi format email, skrip melakukan validasi terhadap duplikat email. Ini dilakukan dengan menggunakan perintah `grep -s -q "^Email: $user_email$" users.txt`. Jika alamat email yang dimasukkan pengguna sudah terdaftar dalam file `users.txt`, maka skrip mencatat pesan kesalahan ke dalam log dan memberi tahu pengguna bahwa alamat email sudah terdaftar.

Jika alamat email valid dan tidak terdaftar sebagai duplikat, maka skrip keluar dari loop menggunakan perintah `break`, dan lanjut ke langkah berikutnya dalam proses registrasi.

    if contains_substring "$user_email" "admin"
    then
            status="Admin"
    else
            status="User"
    fi

Jika email pengguna mengandung kata "Admin", pengguna dianggap sebagai admin; jika tidak, mereka dianggap sebagai User.

    echo "Enter your username:"
    read username

    echo "Enter a security question:"
    read security_question
    echo "Enter the answer to your security question:"
    read security_answer

Skrip meminta pengguna untuk memasukkan username, pertanyaan keamanan, jawaban keamanan, dan password. Kemudian akan menyimpan hasil tersebut ke dalam variabel masing-masingnya yaitu `username`, `security_question`, `security_answer`.

    while true; do
        read -s -p "Enter a password (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol, and not same as username, birhtdate, or name): " password
        echo

        if (( ${#password} < 8 ))
        then
            log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format"
            echo "The password must consist of a minimum of 8 characters."
        elif ! [[ "$password" =~ [A-Z] ]]
        then
            log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
            echo "The password must contain at least 1 uppercase letter."
        elif ! [[ "$password" =~ [a-z] ]]
        then
            log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
            echo "The password must contain at least 1 lowercase letter."
        elif ! [[ "$password" =~ [0-9] ]]
        then
            log_message "REGISTER FAILED" "ERROR Failed register, the user entered the password in the wrong format."
            echo "The password must contain at least 1 number."
        else
            log_message "REGISTER SUCCESS" "user $username as $status registered succesfully"
            encrypted_password=$(echo -n "$password" | base64)
            break
	    fi
    done

`while true; do` Memulai loop tak terbatas untuk memastikan bahwa pengguna akan diminta untuk memasukkan password baru sampai password yang valid dimasukkan.

Skrip memeriksa apakah password memenuhi kriteria yang ditentukan, seperti panjang minimal, memiliki huruf besar dan kecil, dan memiliki angka. Jika password tidak memenuhi kriteria, skrip akan menolak registrasi dan mencatat pesan log.

    log_message "REGISTER SUCCESS" "user $username as $status registered succesfully"
    encrypted_password=$(echo -n "$password" | base64)
    break

Jika password memenuhi semua kriteria yang ditetapkan, maka pesan sukses akan dicatat ke dalam log dan password akan dienkripsi menggunakan base64 sebelum disimpan. Perintah `break` digunakan untuk keluar dari loop setelah password yang valid dimasukkan oleh pengguna.

    echo "Email: $email" >> users.txt
    echo "Status: $status" >> users.txt
    echo "Username: $username" >> users.txt
    echo "Security Question: $security_question" >> users.txt
    echo "Security Answer: $security_answer" >> users.txt
    echo "Password: $encrypted_password" >> users.txt
    echo " " >> users.txt

    echo "Users registered succesfully!"

Setelah semua informasi pengguna dikumpulkan dan divalidasi, informasi tersebut akan ditambahkan ke dalam file users.txt.

`echo " " >> users.txt`: Menyisipkan baris kosong sebagai pemisah antara entri pengguna yang satu dengan yang lain.

`echo "Users registered succesfully!"`: Memberikan pesan bahwa pengguna telah terdaftar dengan sukses.

- **Bash Script Login.sh**

        #!/bin/bash

        log_message()
        {
                local type="$1"
                local message="$2"
                local date_time=$(date +"[%d/%m/%y %H:%M:%S]")
                echo "$date_time [$type] $message" >> auth.log
        }

        echo "Welcome to Login System"
        echo "1. Login"
        echo "2. Forgot Password"
        read choices

        case "$choices" in
            "1")
                echo "Welcome to Login System"
                while true; do
                        echo "Enter your email:"
                        read user_email_login
                        user_info_login=$(grep "^Email: $user_email_login" users.txt)

                        if [ -z "$user_info_login" ]
                        then
                                log_message "LOGIN FAILED" "Login attempt failed. Email $user_email_login is not registered."
                                echo "Email not registered."
                        else
                                break
                        fi
                done
                status_info=$(grep -A 1 "Email: $user_email_login" users.txt | grep "Status" | cut -d ':' -f 2- | xargs)
                username_info=$(grep -A 2 "Email: $user_email_login" users.txt | grep "Username" | cut -d ':' -f 2- | xargs)

                if [ "User" == "$status_info" ]
                then
                        while true; do
                                read -s -p "Enter your password: " password_login
                                echo
                                encrypted_password_login=$(grep -A 5 "Email: $user_email_login" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)
                                stored_password_login=$(echo "$encrypted_password_login" | base64 -d)

                                if [ "$password_login" == "$stored_password_login" ]
                                then
                                        log_message "LOGIN SUCCESS" "user $username_info has logged succesfully as User"
                                        echo "Login succesful!"
                                        echo "You don't have admin privileges. Welcome!"
                                        break
                                else
                                        log_message "LOGIN FAILED" "Login attempt failed. Password entered does not match for email $user_email_login."
                                        echo "Incorrect password!"
                                fi
                        done
                elif [ "Admin" == "$status_info" ]
                then
                        while true; do
                                read -s -p "Enter your password: " password_login
                                echo
                                encrypted_password_login=$(grep -A 5 "Email: $user_email_login" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)
                                stored_password_login=$(echo "$encrypted_password_login" | base64 -d)

                                if [ "$password_login" == "$stored_password_login" ]
                                then
                                        log_message "LOGIN SUCCESS" "user $username_info has logged succesfully as Admin"
                                        echo "Login succesful!"
                                        echo "Admin Menu"
                                        echo "1. Add User"
                                        echo "2. Edit User"
                                        echo "3. Delete User"
                                        echo "4. Logout"
                                        read choices_admin
                                        case "$choices_admin" in
                                                "1")
                                                        while true; do
                                                                echo "Enter your email:"
                                                                read user_email_admin

                                                                contains_substring()
                                                                {
                                                                        [[ $1 == *"$2"* ]]
                                                                }

                                                                validate_email_format()
                                                                {
                                                                        email="$1"
                                                                        if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]
                                                                        then
                                                                                return 0
                                                                        else
                                                                                return 1
                                                                        fi
                                                                }
                                                                if ! validate_email_format "$user_email_admin"
                                                                then
                                                                        log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered an email in the wrong format: $user_email_admin"
                                                                        echo "Invalid email format. Please enter your email in the correct format."
                                                                elif grep -s -q "^Email: $user_email_admin$" users.txt
                                                                then
                                                                        log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info enters the registered email: $user_email_admin"
                                                                        echo "Email $user_email is already registered. Please use another email for registration."
                                                                else
                                                                        break
                                                                fi
                                                        done
                                                        if contains_substring "$user_email_admin" "admin"
                                                        then
                                                                add_status_admin="Admin"
                                                        else
                                                                add_status_admin="User"
                                                        fi
                                                        echo "Enter your username:"
                                                        read add_username_admin
                                                        echo "Enter a security question:"
                                                        read add_security_question_admin
                                                        echo "Enter the answer to your security question:"
                                                        read add_security_answer_admin

                                                        while true; do
                                                                read -s -p "Enter a password (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol, and not same as username, birthdate, or name): " add_password_admin
                                                                echo
                                                                if (( ${#add_password_admin} < 8 ))
                                                                then
                                                                        log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must consist of a minimum of 8 characters."
                                                                elif ! [[ "$add_password_admin" =~ [A-Z] ]]
                                                                then
                                                                        log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must contain at least 1 uppercase letter."
                                                                elif ! [[ "$add_password_admin" =~ [a-z] ]]
                                                                then
                                                                        log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must contain at least 1 lowercase letter."
                                                                elif ! [[ "$add_password_admin" =~ [0-9] ]]
                                                                then
                                                                        log_message "REGISTER FAILED" "ERROR Failed register, the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must contain at least 1 number."
                                                                else
                                                                        log_message "REGISTER SUCCESS" "The admin $username_info added user $add_username_admin as $add_status_admin registered succesfully"
                                                                        add_encrypted_password_admin=$(echo -n "$add_password_admin" | base64)
                                                                        break
                                                                fi
                                                        done
                                                        echo "Email: $user_email_admin" >> users.txt
                                                        echo "Status: $add_status_admin" >> users.txt
                                                        echo "Username: $add_username_admin" >> users.txt
                                                        echo "Security Question: $add_security_question_admin" >> users.txt
                                                        echo "Security Answer: $add_security_answer_admin" >> users.txt
                                                        echo "Password: $add_encrypted_password_admin" >> users.txt
                                                        echo " " >> users.txt

                                                        echo "Users added succesfully!"
                                                ;;
                                                "2")
                                                        while true; do
                                                                echo "Enter user's email you want to edit:"
                                                                read edit_user_email
                                                                line_number=$(grep -n "Email: $edit_user_email$" users.txt | cut -d ':' -f 1)

                                                                if [ -z "$line_number" ]
                                                                then
                                                                        log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info enters the unregistered email: $edit_user_email"
                                                                        echo "Email not registered."
                                                                else
                                                                        break
                                                                fi
                                                        done
                                                        echo "Enter new username:"
                                                        read new_username
                                                        echo "Enter new security question:"
                                                        read new_security_question
                                                        echo "enter new security answer:"
                                                        read new_security_answer
                                                        while true; do
                                                                read -s -p "Enter new password (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol, and not same as username, birthdate, or name): " new_password
                                                                echo
                                                                if (( ${#new_password} < 8 ))
                                                                then
                                                                        log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must consist of a minimum of 8 characters."
                                                                elif ! [[ "$new_password" =~ [A-Z] ]]
                                                                then
                                                                        log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must contain at least 1 uppercase letter."
                                                                elif ! [[ "$new_password" =~ [a-z] ]]
                                                                then
                                                                        log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must contain at least 1 lowercase letter."
                                                                elif ! [[ "$new_password" =~ [0-9] ]]
                                                                then
                                                                        log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                                                                        echo "The password must contain at least 1 number."
                                                                else
                                                                        log_message "REGISTER SUCCESS" "(EDIT USER SUCCESS) the Admin $username_info edited user $edit_user_email information succesfully"
                                                                       new_encrypted_password=$(echo -n "$new_password" | base64)
                                                                break
                                                                fi
                                                        done
                                                        sed -i "$(($line_number + 2))s/Username: .*/Username: $new_username/" users.txt
                                                        sed -i "$(($line_number + 3))s/Security Question: .*/Security Question: $new_security_question/" users.txt
                                                        sed -i "$(($line_number + 4))s/Security Answer: .*/Security Answer: $new_security_answer/" users.txt
                                                        sed -i "$(($line_number + 5))s/Password: .*/Password: $new_encrypted_password/" users.txt
                                                        echo "User information updated succesfully!"
                                                ;;
                                                "3")
                                                        while true; do
                                                                echo "Enter user's email you want to delete:"
                                                                read delete_user_email
                                                                delete_user_info=$(grep "^Email: $delete_user_email" users.txt)

                                                                if [ -z "$delete_user_info" ]
                                                                then
                                                                        log_message "USER DELETED FAILED" "The Admin $username_info enters the unregistered email: $delete_user_email"
                                                                        echo "Email not registered."
                                                                else
                                                                        break
                                                                fi
                                                        done
                                                        sed -i "/Email: $delete_user_email/,+5d" users.txt
                                                        log_message "USER DELETED SUCCESS" "The Admin $username_info deleted user $delete_user_email succesfully"
                                                        echo "User with email $delete_user_email has been deleted."
                                                ;;
                                                "4")
                                                        log_message "LOGOUT" "The Admin $username_info has logged out"
                                                        echo "Logout succesful!"
                                                        exit 1
                                                ;;
                                        esac
                                        break
                                else
                                        log_message "LOGIN FAILED" "ERROR Failed login tttempt on user $username_info with email $user_email_login as Admin entered the wrong password"
                                        echo "Incorrect password!"
                                fi
                        done
                fi
            ;;
            "2")
                echo "Forgot password?"
                while true; do
                        echo "Enter your email:"
                        read user_email
                        user_info=$(grep "^Email: $user_email$" users.txt)

                        if [ -z "$user_info" ]
                        then
                                log_message "PASSWORD RESET FAILED" "Attempted password reset failed. Email $user_email is not registered"
                                echo "Email not registered."
                        else
                                break
                        fi
                done
                security_question=$(grep -A 3 "Email: $user_email" users.txt | grep "Security Question" | cut -d ':' -f 2- | xargs)
                echo "Security Question: $security_question"

                while true; do
                        echo "Enter your answer: "
                        read security_answer

                        stored_answer=$(grep -A 4 "Email: $user_email" users.txt | grep "Security Answer" | cut -d ':' -f 2- | xargs)
                        encrypted_password_hash=$(grep -A 5 "Email: $user_email" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)
                        password_hash=$(echo "$encrypted_password_hash" | base64 -d)
                        if [ "$security_answer" == "$stored_answer" ]
                        then
                                log_message "PASSWORD RESET SUCCESS" "Password reset successful for email $user_email"
                                echo "Your password is: $password_hash"
                                break
                        else
                                log_message "PASSWORD RESET FAILED" "Password reset attempt failed. Incorrect security answer for email $user_email"
                                echo "Incorrect answer!"
                        fi
                done
            ;;
        esac

- **Penjelasan**

        log_message()
        {
                local type="$1"
                local message="$2"
                local date_time=$(date +"[%d/%m/%y %H:%M:%S]")
                echo "$date_time [$type] $message" >> auth.log
        }

Fungsi ini digunakan untuk mencatat pesan log dengan format tertentu ke dalam file auth.log. Ini termasuk tipe pesan (seperti "REGISTER FAILED" atau "REGISTER SUCCESS"), waktu dan tanggal, dan pesan itu sendiri.

    echo "Welcome to Login System"
    echo "1. Login"
    echo "2. Forgot Password"
    read choices

Pesan sambutan dan opsi login ditampilkan kepada pengguna, dan kemudian pengguna diminta untuk memilih opsi menggunakan `read choices`.

    case "$choices" in
        "1")
            # Proses Login
        ;;
        "2")
            # Proses Lupa Password
        ;;
    esac

Struktur `case` digunakan untuk menangani pilihan yang dipilih pengguna setelah memilih opsi dari menu. Opsi "1" akan mengeksekusi proses login, sementara opsi "2" akan mengeksekusi proses lupa password.

    echo "Welcome to Login System"
    while true; do
            echo "Enter your email:"
            read user_email_login
            user_info_login=$(grep "^Email: $user_email_login" users.txt)

            if [ -z "$user_info_login" ]
            then
                    log_message "LOGIN FAILED" "Login attempt failed. Email $user_email_login is not registered."
                    echo "Email not registered."
            else
                    break
            fi
    done

Bagian kode ini merupakan proses untuk meminta pengguna memasukkan email saat melakukan proses login. Setelah email dimasukkan, sistem akan memeriksa apakah email tersebut terdaftar dalam database (dalam hal ini `users.txt`). Jika email tidak terdaftar, pesan kesalahan akan dicatat dalam log dan ditampilkan kepada pengguna. Jika email terdaftar, program akan keluar dari loop menggunakan `break` dan melanjutkan proses login selanjutnya.

    status_info=$(grep -A 1 "Email: $user_email_login" users.txt | grep "Status" | cut -d ':' -f 2- | xargs)
    username_info=$(grep -A 2 "Email: $user_email_login" users.txt | grep "Username" | cut -d ':' -f 2- | xargs)

`status_info=$(grep -A 1 "Email: $user_email_login" users.txt | grep "Status" | cut -d ':' -f 2- | xargs)`: Menggunakan perintah `grep` untuk mencari baris yang mengandung email yang sesuai dalam file `users.txt`, lalu menggunakan `grep` lagi untuk mencari baris yang mengandung informasi status, kemudian menggunakan `cut` untuk memotong bagian yang tidak diperlukan, dan `xargs` untuk menghilangkan spasi ekstra dari hasilnya. Hasilnya disimpan dalam variabel `status_info`.

`username_info=$(grep -A 2 "Email: $user_email_login" users.txt | grep "Username" | cut -d ':' -f 2- | xargs)`: Melakukan hal yang serupa dengan langkah sebelumnya untuk mendapatkan informasi username pengguna. Hasilnya disimpan dalam variabel `username_info`.

    if [ "User" == "$status_info" ]
    then
            while true; do
                    read -s -p "Enter your password: " password_login
                    echo
                    encrypted_password_login=$(grep -A 5 "Email: $user_email_login" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)
                    stored_password_login=$(echo "$encrypted_password_login" | base64 -d)

                    if [ "$password_login" == "$stored_password_login" ]
                    then
                            log_message "LOGIN SUCCESS" "user $username_info has logged succesfully as User"
                            echo "Login succesful!"
                            echo "You don't have admin privileges. Welcome!"
                            break
                    else
                            log_message "LOGIN FAILED" "Login attempt failed. Password entered does not match for email $user_email_login."
                            echo "Incorrect password!"
                    fi
            done

Pengguna diminta untuk memasukkan password menggunakan perintah `read -s -p "Enter your password: " password_login`, di mana `-s` digunakan untuk menyembunyikan input password.

Password yang dimasukkan oleh pengguna dibandingkan dengan password yang disimpan dalam file `users.txt` setelah di-decode dari format base64.

Jika password yang dimasukkan oleh pengguna sesuai dengan password yang disimpan, maka login berhasil dicatat dalam log dan pesan selamat datang ditampilkan.

Jika password tidak cocok, pesan kesalahan ditampilkan dan pengguna diminta untuk memasukkan password kembali.

Proses akan terus berulang sampai pengguna berhasil login.

    elif [ "Admin" == "$status_info" ]
    then
            while true; do
                    read -s -p "Enter your password: " password_login
                    echo
                    encrypted_password_login=$(grep -A 5 "Email: $user_email_login" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)
                    stored_password_login=$(echo "$encrypted_password_login" | base64 -d)

                    if [ "$password_login" == "$stored_password_login" ]
                    then

`elif [ "Admin" == "$status_info" ]`: Ini adalah kondisi `elif` (else if) yang memeriksa apakah status_info sama dengan "Admin". Jika ya, maka proses login untuk admin akan dimulai.

`while true; do`: Ini memulai loop tak terbatas di mana admin diminta untuk memasukkan kata sandi mereka.

`read -s -p "Enter your password: " password_login`: Ini meminta admin untuk memasukkan kata sandi mereka secara diam-diam menggunakan opsi `-s` (silent) sehingga kata sandi tidak ditampilkan di layar.

`encrypted_password_login=$(grep -A 5 "Email: $user_email_login" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)`: Ini adalah perintah untuk mengambil kata sandi terenkripsi dari file `users.txt`. Ini mencari baris yang mengandung alamat email yang sesuai dengan alamat email yang dimasukkan admin, kemudian mengambil kata sandi dari baris tersebut. `grep -A 5` digunakan untuk mengambil 5 baris setelah baris yang cocok dengan pola pencarian, yang berisi kata sandi.

`stored_password_login=$(echo "$encrypted_password_login" | base64 -d)`: Kata sandi yang dienkripsi sebelumnya di-dekode menggunakan `base64 -d` sehingga dapat dibandingkan dengan kata sandi yang dimasukkan oleh admin.

`if [ "$password_login" == "$stored_password_login" ]`: Ini membandingkan kata sandi yang dimasukkan oleh admin dengan kata sandi yang disimpan di file `users.txt` setelah didekode. Jika kedua kata sandi cocok, admin dianggap berhasil login.

log_message "LOGIN SUCCESS" "user $username_info has logged succesfully as Admin"

    echo "Login succesful!"
    echo "Admin Menu"
    echo "1. Add User"
    echo "2. Edit User"
    echo "3. Delete User"
    echo "4. Logout"
    read choices_admin

Struktur case digunakan untuk menangani pilihan yang dipilih oleh admin setelah login sebagai admin.
Opsi-opsi tersebut meliputi menambahkan pengguna baru, mengedit pengguna, menghapus pengguna, dan logout.

    echo "1. Add User"

pada bagian ini, struktur fungsi script ini sama dengan Register.sh.

    echo "2. Edit User"

    while true; do
            echo "Enter user's email you want to edit:"
            read edit_user_email
            line_number=$(grep -n "Email: $edit_user_email$" users.txt | cut -d ':' -f 1)

            if [ -z "$line_number" ]
            then
                    log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info enters the unregistered email: $edit_user_email"
                    echo "Email not registered."
            else
                    break
            fi
    done

`while true; do`: Ini memulai loop tak terbatas di mana admin diminta untuk memasukkan alamat email pengguna yang ingin mereka edit.

`echo "Enter user's email you want to edit:"`: Ini mencetak pesan yang meminta admin untuk memasukkan alamat email pengguna yang ingin mereka edit.

`read edit_user_email`: Ini menyimpan alamat email yang dimasukkan admin ke dalam variabel edit_user_email.

`line_number=$(grep -n "Email: $edit_user_email$" users.txt | cut -d ':' -f 1)`: Ini mencari nomor baris di file `users.txt` di mana alamat email yang dimasukkan admin cocok dengan yang terdaftar. `grep -n` digunakan untuk mencari nomor baris yang cocok, kemudian `cut -d ':' -f 1` digunakan untuk memisahkan nomor baris dari output `grep`.

`if [ -z "$line_number" ]`: Ini memeriksa apakah variabel `$line_number` kosong, yang berarti tidak ada baris yang cocok dengan alamat email yang dimasukkan admin.

`log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info enters the unregistered email: $edit_user_email"`: Jika tidak ada baris yang cocok, maka pesan kesalahan dicetak menggunakan fungsi `log_message`, dan pesan juga dicetak ke layar yang menginformasikan bahwa alamat email yang dimasukkan tidak terdaftar.

`else`: Jika ada baris yang cocok dengan alamat email yang dimasukkan admin, maka loop dihentikan dengan `break` dan admin dapat melanjutkan proses pengeditan pengguna yang dipilih.

    echo "Enter new username:"
    read new_username
    echo "Enter new security question:"
    read new_security_question
    echo "enter new security answer:"
    read new_security_answer

Admin diminta untuk memasukkan username baru untuk pengguna yang akan diubah.
Selanjutnya, admin diminta untuk memasukkan pertanyaan keamanan baru untuk pengguna tersebut.
Setelah itu, admin diminta untuk memasukkan jawaban keamanan baru untuk pengguna yang dipilih.

    while true; do
            read -s -p "Enter new password (minimum 8 characters, at least 1 uppercase letter, 1 lowercase letter, 1 digit, 1 symbol, and not same as username, birthdate, or name): " new_password
            echo
            if (( ${#new_password} < 8 ))
            then
                    log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                    echo "The password must consist of a minimum of 8 characters."
            elif ! [[ "$new_password" =~ [A-Z] ]]
            then
                    log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                    echo "The password must contain at least 1 uppercase letter."
            elif ! [[ "$new_password" =~ [a-z] ]]
            then
                    log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                    echo "The password must contain at least 1 lowercase letter."
            elif ! [[ "$new_password" =~ [0-9] ]]
            then
                    log_message "REGISTER FAILED" "(EDIT USER FAILED) the Admin $username_info entered the password in the wrong format"
                    echo "The password must contain at least 1 number."
            else
                    log_message "REGISTER SUCCESS" "(EDIT USER SUCCESS) the Admin $username_info edited user $edit_user_email information succesfully"
                    new_encrypted_password=$(echo -n "$new_password" | base64)
            break
            fi
    done

`while true`; do Memulai loop tak terbatas untuk memastikan bahwa admin akan diminta untuk memasukkan password baru sampai password yang valid dimasukkan.

Skrip memeriksa apakah password memenuhi kriteria yang ditentukan, seperti panjang minimal, memiliki huruf besar dan kecil, dan memiliki angka. Jika password tidak memenuhi kriteria, skrip akan menolak registrasi dan mencatat pesan log.

    log_message "REGISTER SUCCESS" "user $username as $status registered succesfully"
    encrypted_password=$(echo -n "$password" | base64)
    break
Jika password memenuhi semua kriteria yang ditetapkan, maka pesan sukses akan dicatat ke dalam log dan password akan dienkripsi menggunakan base64 sebelum disimpan. Perintah break digunakan untuk keluar dari loop setelah password yang valid dimasukkan oleh admin.

    sed -i "$(($line_number + 2))s/Username: .*/Username: $new_username/" users.txt
    sed -i "$(($line_number + 3))s/Security Question: .*/Security Question: $new_security_question/" users.txt
    sed -i "$(($line_number + 4))s/Security Answer: .*/Security Answer: $new_security_answer/" users.txt
    sed -i "$(($line_number + 5))s/Password: .*/Password: $new_encrypted_password/" users.txt
    echo "User information updated succesfully!"

`sed -i "$(($line_number + 2))s/Username: .*/Username: $new_username/" users.txt`: Menggunakan `sed` untuk mengubah baris yang mengandung informasi username pengguna yang diubah. `$line_number` adalah nomor baris yang sesuai dengan email pengguna yang diedit. Baris ini akan diganti dengan informasi username baru yang dimasukkan oleh admin.

`sed -i "$(($line_number + 3))s/Security Question: .*/Security Question: $new_security_question/" users.txt`: Menggunakan `sed` untuk mengubah baris yang mengandung pertanyaan keamanan pengguna yang diubah. Baris ini akan diganti dengan pertanyaan keamanan baru yang dimasukkan oleh admin.

`sed -i "$(($line_number + 4))s/Security Answer: .*/Security Answer: $new_security_answer/" users.txt`: Menggunakan `sed` untuk mengubah baris yang mengandung jawaban keamanan pengguna yang diubah. Baris ini akan diganti dengan jawaban keamanan baru yang dimasukkan oleh admin.

`sed -i "$(($line_number + 5))s/Password: .*/Password: $new_encrypted_password/" users.txt`: Menggunakan `sed` untuk mengubah baris yang mengandung kata sandi pengguna yang diubah. Baris ini akan diganti dengan kata sandi baru yang telah dienkripsi sebelumnya oleh admin.

Setelah semua perubahan dilakukan, pesan "User information updated succesfully!" akan dicetak untuk memberi tahu admin bahwa informasi pengguna telah berhasil diperbarui.

    "3")
            while true; do
                    echo "Enter user's email you want to delete:"
                    read delete_user_email
                    delete_user_info=$(grep "^Email: $delete_user_email" users.txt)

                    if [ -z "$delete_user_info" ]
                    then
                            log_message "USER DELETED FAILED" "The Admin $username_info enters the unregistered email: $delete_user_email"
                            echo "Email not registered."
                    else
                            break
                    fi
            done
            sed -i "/Email: $delete_user_email/,+5d" users.txt
            log_message "USER DELETED SUCCESS" "The Admin $username_info deleted user $delete_user_email succesfully"
            echo "User with email $delete_user_email has been deleted."
    ;;

Pada bagian `while true; do`, admin diminta untuk memasukkan alamat email pengguna yang ingin dihapus dari sistem.
Kemudian, alamat email yang dimasukkan oleh admin diperiksa dalam file `users.txt` menggunakan perintah `grep`. Jika tidak ditemukan, pesan kesalahan ditampilkan dan admin diminta untuk memasukkan ulang alamat email yang valid.
Jika alamat email ditemukan, perulangan akan diakhiri.

Setelah admin memasukkan alamat email yang valid, perintah `sed -i "/Email: $delete_user_email/,+5d" users.txt` digunakan untuk menghapus entri pengguna yang terkait dengan alamat email tersebut beserta informasi pengguna lainnya dari file `users.txt`. Perintah ini menggunakan `sed` untuk menghapus baris yang dimulai dari baris yang mengandung alamat email hingga 5 baris setelahnya.

Pesan log dicatat menggunakan `log_message()` untuk mencatat bahwa pengguna telah berhasil dihapus oleh admin.

Pesan berhasil ditampilkan kepada admin bahwa pengguna dengan alamat email yang telah dihapus berhasil dihapus dari sistem.

                                            "4")
                                                    log_message "LOGOUT" "The Admin $username_info has logged out"
                                                    echo "Logout succesful!"
                                                    exit 1
                                            ;;
                                    esac
                                    break
                            else
                                    log_message "LOGIN FAILED" "ERROR Failed login tttempt on user $username_info with email $user_email_login as Admin entered the wrong password"
                                    echo "Incorrect password!"
                            fi
                    done
            fi
    ;;

`case "$choices_admin" in`: Ini adalah awal dari sebuah struktur `case` yang mengevaluasi nilai dari variabel `$choices_admin`, yang merupakan pilihan yang dipilih oleh admin setelah berhasil login.

`"4")`: Ini adalah opsi keempat di dalam struktur case, yang menunjukkan bahwa admin memilih untuk logout.

`log_message "LOGOUT" "The Admin $username_info has logged out"`: Fungsi `log_message` dipanggil untuk mencatat pesan logout ke dalam log dengan informasi bahwa admin tertentu telah logout.

`echo "Logout succesful!"`: Pesan ini dicetak untuk memberi tahu admin bahwa proses logout telah berhasil.

`exit 1`: Perintah `exit` digunakan untuk keluar dari skrip dengan kode keluar 1, menandakan bahwa proses telah selesai dan skrip berakhir.

    "2")
            echo "Forgot password?"
            while true; do
                    echo "Enter your email:"
                    read user_email
                    user_info=$(grep "^Email: $user_email$" users.txt)

                    if [ -z "$user_info" ]
                    then
                            log_message "PASSWORD RESET FAILED" "Attempted password reset failed. Email $user_email is not registered"
                            echo "Email not registered."
                    else
                            break
                    fi
            done

`while true; do`: Memulai loop tak terbatas untuk memastikan bahwa pengguna terus diminta untuk memasukkan email sampai email yang terdaftar ditemukan.

`user_info=$(grep "^Email: $user_email$" users.txt)`: Mencari informasi pengguna berdasarkan email yang dimasukkan dalam file `users.txt` menggunakan perintah `grep`. Hasil pencarian disimpan dalam variabel `user_info`.

`if [ -z "$user_info" ]`: Memeriksa apakah variabel `user_info` kosong, yang berarti email yang dimasukkan tidak terdaftar dalam sistem.

Jika email tidak terdaftar, pesan kesalahan dicatat dalam log menggunakan fungsi `log_message()` dan pesan kesalahan juga ditampilkan kepada pengguna bahwa email tidak terdaftar.

Jika email terdaftar, loop akan dihentikan dengan perintah `break`, dan proses reset password akan dilanjutkan.

    security_question=$(grep -A 3 "Email: $user_email" users.txt | grep "Security Question" | cut -d ':' -f 2- | xargs)
    echo "Security Question: $security_question"

`grep -A 3 "Email: $user_email" users.txt`: Menggunakan `grep` untuk mencari baris yang mengandung email pengguna dalam file `users.txt`, serta tiga baris setelahnya (`-A 3`).

`grep "Security Question"`: Menggunakan `grep` sekali lagi untuk mencari baris yang mengandung kata kunci "Security Question" di antara hasil pencarian sebelumnya.

`cut -d ':' -f 2-`: Menggunakan `cut` untuk memotong setiap baris berdasarkan delimiter `:` dan mengambil bagian kedua dan seterusnya (kolom yang berisi pertanyaan keamanan).

`xargs`: Menghapus spasi tambahan di sekitar hasil pencarian sebelum menampilkan pertanyaan keamanan.

Kemudian, pertanyaan keamanan yang ditemukan akan ditampilkan kepada pengguna.

                    while true; do
                            echo "Enter your answer: "
                            read security_answer

                            stored_answer=$(grep -A 4 "Email: $user_email" users.txt | grep "Security Answer" | cut -d ':' -f 2- | xargs)
                            encrypted_password_hash=$(grep -A 5 "Email: $user_email" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)
                            password_hash=$(echo "$encrypted_password_hash" | base64 -d)
                            if [ "$security_answer" == "$stored_answer" ]
                            then
                                    log_message "PASSWORD RESET SUCCESS" "Password reset successful for email $user_email"
                                    echo "Your password is: $password_hash"
                                    break
                            else
                                    log_message "PASSWORD RESET FAILED" "Password reset attempt failed. Incorrect security answer for email $user_email"
                                    echo "Incorrect answer!"
                            fi
                    done
            ;;
    esac

`while true; do`: Memulai loop tak terbatas untuk memastikan bahwa pengguna akan diminta untuk memasukkan jawaban keamanan sampai jawaban yang benar dimasukkan.

`echo "Enter your answer: "`: Menampilkan pesan untuk meminta pengguna memasukkan jawaban keamanan.
`read security_answer`: Mengambil input jawaban keamanan dari pengguna dan menyimpannya dalam variabel `security_answer`.

`stored_answer=$(grep -A 4 "Email: $user_email" users.txt | grep "Security Answer" | cut -d ':' -f 2- | xargs)`: Mengambil jawaban keamanan yang tersimpan dalam file `users.txt` untuk email yang sesuai dengan email pengguna yang lupa password.

`encrypted_password_hash=$(grep -A 5 "Email: $user_email" users.txt | grep "Password" | cut -d ':' -f 2- | xargs)`: Mengambil hash kata sandi yang terenkripsi dari file `users.txt` untuk email yang sesuai dengan email pengguna yang lupa password.

`password_hash=$(echo "$encrypted_password_hash" | base64 -d)`: Mendekripsi hash kata sandi yang terenkripsi menggunakan base64 sehingga kata sandi asli dapat ditampilkan kepada pengguna setelah berhasil me-reset kata sandi.

`if [ "$security_answer" == "$stored_answer" ]`: Memeriksa apakah jawaban keamanan yang dimasukkan oleh pengguna sama dengan jawaban keamanan yang tersimpan di database.

`log_message "PASSWORD RESET SUCCESS" "Password reset successful for email $user_email"`: Mencatat pesan log yang menyatakan bahwa proses reset password berhasil jika jawaban keamanan yang dimasukkan oleh pengguna sesuai dengan yang tersimpan.

`echo "Your password is: $password_hash"`: Menampilkan kata sandi yang berhasil di-reset kepada pengguna.

`break`: Menghentikan loop setelah proses reset password berhasil.

`log_message "PASSWORD RESET FAILED" "Password reset attempt failed. Incorrect security answer for email $user_email"`: Mencatat pesan log yang menyatakan bahwa proses reset password gagal karena jawaban keamanan yang salah.
`echo "Incorrect answer!"`: Memberikan pesan kepada pengguna bahwa jawaban keamanan yang dimasukkan tidak benar.

### Kendala Pengerjaan Soal 2

**Tidak ada**

### Screenshot Hasil Pengerjaan Soal 2

* **register.sh**

Apabila salah memasukkan format email, maka tampilan seperti di bawah ini:

![salah format email](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/95b0839d-b166-4979-9c00-91068caaf07b)

Apabila benar memasukkan format email, maka akan dilanjutkan untuk menginputkan username, security question, security answer, dan password. Seperti gambar di bawah ini:

![format email yang benar](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/25f3df8a-4473-456e-9aaa-4dce785aeb03)

Ketika memasukkan passoword yang tidak sesuai kriteria, misalkan saya disini melakukan percobaan memasukkan password batu(minimum 8 character), batusangkar(at least 1 uppercase letter), Batusangkar(at least 1 number), Batusangkar24(format password yang benar) 

![Password salah](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/43d1a118-156d-4260-bbf7-1cc7175881ed)

Kali ini mencoba mendaftarkan pengguna sebagai admin, dengan email harus mengandung kata "admin"

![admin register](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/0c2fc696-7cc9-4233-a8b2-6c6f156cdc9b)

Kali ini mencoba mendaftarkan pengguna sebagai user, untuk percobaan pada login.sh nanti

![user baru register](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/a28cf8b9-a5b6-4e79-8044-a78bc05b18bc)

Berikut ini tampilan list users.txt setelah melakukan beberapa register pada register.sh

![list users](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/18e6cf3b-f44d-48e1-af7c-4b561917b8f0)

Berikut ini adalah tampilan dari auth.log setelah melakukan beberapa register pada register.sh

![auth_log1](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/76c016e7-638b-4132-abf8-a6417d278551)

Terdapat beberapa kejadian "REGISTER FAILED" karena pengguna salah memasukkan format email dan password, serta informasi timestamp yang realtime. Selain itu, juga terdapat kejadian "REGISTER SUCCESS" yang menandakan berhasilnya beberapa pengguna mendaftar, dengan informasi username dan status yang tercatat dalam log.

* **login.sh**

* 1. Opsi Login

**Status as User**

Jika memasukkan email yang tidak terdaftar dalam data users.txt, maka tampilan akan seperti di bawah ini:

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/fb7c8061-3d0c-44f5-b9c3-5b0aa34411b5)

Jika salah memasukkan password, maka tampilan akan seperti di bawah ini:

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/2cd6863a-10d4-4f25-8be9-683d778f0511)

Jika benar memasukkan password, maka tampilan akan seperti di bawah ini:

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/a85c8512-654d-4c66-abfd-396d47bb525b)

Berikut ini adalah tampilan dari auth.log setelah melakukan percobaan login pada login.sh

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/91bf149f-f0bd-4144-b6a1-f39d1e55dc7f)

Terdapat beberapa "LOGIN FAILED" karena pengguna salah memasukkan email yang dimana email tersebut tidak terdaftar di dalam list users.txt, dan pengguna juga salah memasukkan password untuk email tioirin2004@gmail.com. Selain itu, juga terdapat "LOGIN SUCCESS" karena pengguna dengan username axl berhasil login sebagai User.

**Status as Admin**

Berikut ini tampilan melakukan login sebagai Admin

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/19ecdeec-829c-429e-acfb-f6f12c741962)

Berikut ini tampilan dari auth.log setelah melakukan login dengan username admin sebagai Admin

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/16e539bc-2fd6-46a3-8e22-e6a2f3188d43)

1. Add User

Di bawah ini adalah tampilan jika admin ingin menambahkan user dengan memasukkan email yang sudah terdaftar di data users.txt

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/ae1cebee-92a7-4879-8d2c-d22e2963c12f)

Berikut ini tampilan jika Admin berhasil menambahkan user

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/10fa45d1-079e-41b7-bc10-8f21d590fb3e)

Berikut ini tampilan dari auth.log setelah Admin melakukan "1. Add User"

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/181ba75b-8e88-4316-8207-8168ade99ab3)

Begitu juga jika Admin ingin menambahkan user baru dengan status sebagai Admin baru.

2. Edit User

Di bawah ini adalah tampilan jika Admin ingin melakukan edit kepada pengguna dengan memasukkan email yang sudah terdaftar di data users.txt

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/858c0f25-4049-4384-8b2d-a02806ed52cc)

Berikut ini tampilan jika Admin berhasil melakukan edit kepada pengguna

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/72e8a916-9583-4fb2-a196-f96b76e07165)

Sebelum diedit:

![user_baru](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/0994c745-0921-4c8f-8e5e-c04457ed1835)

Setelah diedit:

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/ba0c5428-a099-4467-bee9-2d266d581669)

Berikut ini tampilan dari auth.log setelah Admain melakukan "2. Edit User"

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/b5fc42d2-8d9d-40f8-9e5b-b71816b225dc)

3. Delete User

Di bawah ini adalah tampilan jika Admin ingin melakukan delete kepada pengguna dengan memasukkan email yang tidak terdaftar di data users.txt

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/aaa6561e-5e70-4f4f-821f-782d078841d5)

Berikut ini jika Admin berhasil melakukan delete kepada pengguna

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/7e071a0a-d9aa-4fd6-8da1-e52a8a0ef3c0)

Sebelum didelete:

![sebelum_hapus_user](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/724e233e-fa41-44e0-bdcb-fe9e36369435)

Setelah didelete:

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/26e69395-fd3e-4d59-8cd2-782a22be2f2b)

Berikut ini tampilan dari auth.log setelah Admin melakukan "3. Delete User"

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/a792e488-d746-4a4c-891e-750e6e76ee6d)

4. Logout

Di bawah ini jika Admin melakukan Logout

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/2e9ebd32-e57b-4f1e-a71e-f753ae7ac516)

Berikut ini tampilan dari auth.log setelah Admin melakukan "4. Logout"

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/f6491756-ae5c-4e1f-adbc-69c439f84db8)

* 2. Opsi Forgot Password
 
Di bawah ini adalah tampilan jika pengguna melakukan "2. Forgot Password" dengan memasukkan email yang tidak terdaftar di data users.txt

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/148dc5f3-b1b4-4f9e-9917-9bfaca866907)

Berikut ini tampilan jika pengguna berhasil memasukkan email tetapi salah memasukkan security answer dari email tersebut

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/1e088330-43da-4e12-a491-aa42702b6277)

Berikut ini tampilan jika pengguna memasukkan security asnwer yang benar dan akan menampilkan password dari email tersebut

![image](https://github.com/fioreenza/Sisop-1-2024-MH-IT25/assets/144349814/3f0121e7-f266-427a-b59a-3aeeadc6ae87)

## Soal 3

**Oleh Fiorenza Adelia Nalle (5027231053)**

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

**Oleh Tio Axellino Irin (5027231065)**

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

