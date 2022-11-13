# PBP Tugas 8

Nama : Davyn Reinhard Santoso

NPM : 2106751083

Kelas : PBP - C

# Links

[Repository](https://github.com/dreins/pbp-flutter-lab.git)

# Jawaban

## 1. Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`
Metode `push` digunakan untuk menambahkan rute atau page lain di atas page saat ini, sedangkan `pushReplacement` digunakan untuk menambahkan rute atau page dan juga menghapus page yang ada saat ini. 

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

- Row
Untuk mengatur layout dalam format kolom, yaitu menurun secara horizontal

- Text
Untuk membuat objek berupa teks yang dapat ditampilkan pada program

- FloatingActionButton
Untuk membuat objek berupa button yang dapat menambahkan counter dan mengurangi counter

- Padding
Untuk memberikan jarak antar elemen widget

- Drawer
Untuk membuat fitur navigasi menuju page lain

- Form
Untuk mempermudah proses pembuatan dalam fitur Form yang menerima input dari pengguna

- TextFormField
Untuk membuat objek berupa input field

- ElevatedButton
Untuk membuat objek berupa button yang digunakan untuk menyimpan input dalam list

- DropdownButton
Untuk membuat objek berupa pemilihan opsi dalam fitur dropdown

- ListView.builder
Untuk melakukan iterasi pada widget list

- ListTile
Untuk membuat objek - objek yang dibutuhkan pada Drawer

## 3. Sebutkan jenis-jenis event yang ada pada Flutter.
- `onPressed`
- `onTap`
- `onChanged`
- `onSaved`

## 4. Jelaskan bagaimana cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter.
`Navigator` bekerja dengan cara menampilkan page yang menjadi elemen teratas dengan konsep stack dalam hal routingnya dan memperhatikan method yang digunakan pada objek `Navigator` seperti `Navigator.push` dan `Navigator.pushReplacement`. Untuk melakukan prosesnya, `BuildContext` pada widget `build` akan melakukan penyimpanan rute dan mendeteksi methodnya. 

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat folder pada aplikasi `counter_7` untuk membagi models dan page

2. Menambahkan file `add_budget.dart`, `counter_7.dart`, `show_budget.dart`, `appdrawer.dart`, dan `budget.dart` sebagai models budget.

3. Menambahkan `Drawer` pada file `appdrawer.dart` dan melakukan routing dengan memanggil classnya pada tiap - tiap page terkait

4. Menambahkan models pada file  `budget.dart` 
```Dart
    class BudgetDetails {
        final String judul;
        final int nominal;
        final String jenisBudget;
        final DateTime tanggalTransaksi;

    BudgetDetails({
        required this.judul,
        required this.nominal,
        required this.jenisBudget,
        required this.tanggalTransaksi,
        });
    }
```

5. Menambahkan implementasi `Form` dan `TextFormField` pada file `add_budget.dart` ditambahkan dengan implementasi `DropdownButton` untuk memilih jenis budget dan `ElevatedButton` dengan action listener untuk menyimpan budget ke dalam list

dengan cara menambahkan `children` pada widget `FloatingActionButton` dan memanggil widget `Row` dikarenakan tombol berada satu baris

6. Membuat list bernama `detailBudget` dengan tipe class `BudgetDetails` dan memanggilnya pada constructor class utama pada tiap - tiap file 
```Dart
   final List<BudgetDetails> detailBudget;
``` 

7. Menambahkan kode pada widget `ElevatedButton` untuk menyimpan objek yang diinput oleh pengguna dengan perintah `widget.detailBudget.add(budget)` dan menampilkan tiap - tiap objek pada page milik `show_budget.dart` dengan menggunakan widget `ListView.builder` untuk melakukan iterasi tiap - tiap objek

