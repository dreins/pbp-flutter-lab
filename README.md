# PBP Tugas 7

Nama : Davyn Reinhard Santoso

NPM : 2106751083

Kelas : PBP - C

# Links

[Repository](https://github.com/dreins/pbp-flutter-lab.git)

# Jawaban

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
### A. Stateless widget
Merupakan jenis widget dalam Flutter yang menampilkan desain antarmuka untuk pengguna aplikasi secara konkret, statis, dan tidak berubah - ubah

### B. Stateful widget
Merupakan kebalikan dari stateless widget, dimana stateful widget menampilkan desain antarmuka dengan secara dinamis dan berubah - ubah pada komponennya.

### C. Perbedaan
Perbedaan utama dari kedua jenis widget terletak pada konfigurasi perubahan desain antarmuka, dimana konfigurasi pada stateless widget akan diinisiasikan sejak awal dan tentunya akan bersifat statis, sedangkan stateless widget dapat diperbaharui kapanpun tergantung kepada perubahan data atau user actions. 

## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Class : Stateless Widget
Untuk menentukan konfigurasi program pada bagian judul, tema dan warna utama.

- MyApp
Merupakan widget induk atau akar dari Stateless widget pada program

- Class : Stateful Widget
Untuk menentukan konfigurasi program pada bagian utama, yaitu tulisan dan counter yang berubah - ubah beserta penggunaan button sebagai perantara aksi user

- MyHomePage
Merupakan widget induk atau akar dari Stateful widget pada program

- MaterialApp
Untuk membungkus beberapa widget yang bersangkutan dengan program menggunakan tema material design

- Scaffold
Untuk menjadi canvas utama dalam strukturisasi dasar material design

- AppBar
Untuk membuat app bar, yaitu istilah navigation bar milik aplikasi mobile

- Center
Untuk mengatur layout agar widget memiliki posisi di tengah

- Column
Untuk mengatur layout dalam format kolom, yaitu menurun secara vertikal

- Text
Untuk membuat objek berupa teks yang dapat ditampilkan pada program

- FloatingActionButton
Untuk membuat objek berupa button yang dapat menambahkan counter dan mengurangi counter

## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Dalam program ini, `setState()` digunakan pada fungsi yang menambahkan dan mengurangi counter. Pada dasarnya, `setState()` berfungsi untuk menginformasikan widget bahwa terdapat perubahan pada suatu objek yang berubah pada State, sehingga aplikasi dapat melakukan reload ulang terhadap perubahan widget. Variabel yang dapat terdampak pada program ini adalah variabel `counter`, dimana penambahan ataupun pengurangan counter dideklarasikan di dalam fungsi `setState()`. Hal ini juga menjadi alasan mengapa `setState()` hanya dapat digunakan pada Stateful Widget, yaitu jenis widget yang dinamis

## 4. Jelaskan perbedaan antara const dengan final.
Perbedaan `const` dan `final` dapat dilihat pada inisialisasi atau pemberian nilai variabel, dimana const harus diinisialisasikan pada saat kompilasi, atau pemberiannya dilakukan secara langsung atau eksplisit saat mendeklarasikan variabel. Nilai const bersifat konstan. Final sendiri tidak mengharuskan inisialisasi secara langsung saat deklarasinya. Jadi, nilai const akan diketahui saat compilation time dan final saat run time. 

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat folder pada local sebagai tempat untuk menaruh seluruh dokumen aplikasi

2. Membuat program berbasis Flutter dengan cara menjalankan perintah `CTRL + Shift + P`, lalu memilih fitur `Flutter : New Project` dan memberi nama project seperti berikut
    `counter_7`

3. Menyambungkan dengan github dengan perintah berikut didahului dengan membuat repo dengan nama `pbp-flutter-lab`
```bash
    git init
    git remote add origin https://github.com/dreins/pbp-flutter-lab.git
```

4. Menambahkan fungsi `_decrementCounter` dengan spesifikasi mengurangi counter seperti berikut 
```Dart
    void _decrementCounter() {
        setState(() {
            _counter--;
        });
    }
```

5. Menambahkan button `-` dengan cara menambahkan `children` pada widget `FloatingActionButton` 

6. Menambahkan conditionals pada widget `Text` dan mengatur styling warna menggunakan conditionals

7. ...

