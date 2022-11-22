# PBP Tugas 9

Nama : Davyn Reinhard Santoso

NPM : 2106751083

Kelas : PBP - C

# Links

[Repository](https://github.com/dreins/pbp-flutter-lab.git)

# Jawaban

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Data JSON dapat diambil tanpa membuat model terlebih dahulu, namun hal tersebut merupakan hal yang tidak efektif dikarenakan penggunaan model ditujukan sebagai blueprint untuk meminimalisir kesalahan ketika mengambil file dengan format JSON maupun sebaliknya.

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

- Container
Untuk membungkus widget lainnya

- FutureBuilder
Untuk membuat widget sesuai dengan snapshot terakhir pada class `Future`

- SizedBox
Untuk membuat widget berupa box dengan ukuran tertentu

- InkWell
Untuk membuat suatu widget yang dapat merespon sentuhan

- AsyncSnapshot
Untuk merepresentasikan interaksi terakhir dengan komputasi terakhir secara immutable

- Checkbox
Untuk membuat widget berupa checkbox

- Expanded
Untuk memperluas daerah secara vertikal pada layar

## 3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Pengambilan data dari JSON pada `Dart` dapat dilakukan dengan membuat sebuah function bertipe http request dengan melakukan `Uri.parse` terhadap link yang mengandung JSON, lalu mengambilnya menggunakan `get` dengan tipe `application/json`. Selanjutnya, data yang telah diambil tadi dapat di-decode menggunakan `jsonDecode()` yang nantinya akan di-convert melalui model yang telah dibuat dan ditampilkan secara asinkronus menggunakan widget `FutureBuilder`

Membuat sebuah function http request dengan method GET secara async untuk mengambil data ke pihak eksternal
Pada function tersebut lakukan parsing dengan jsonDecode() untuk mengubah response String menjadi JSON
Konversi object JSON ke dalam suatu Model object
Gunakan widget FutrueBuilder untuk menampilkan widget-widget dengan snapshot data terbaru yang telah dikonversi menjadi sebuah object

## 4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat folder pada aplikasi `counter_7` untuk membagi models dan page

2. Menambahkan file `show_watchlist.dart`, `watchlist_detail.dart` sebagai models mywatchlist.

3. Menambahkan `Drawer` pada file `appdrawer.dart` dan melakukan routing dengan memanggil classnya pada tiap - tiap page terkait

4. Menambahkan models pada file  `mywatchlist.dart` yang memetakan fields pada json milik Tugas 3
```Dart
    class MyWatchlist {

    MyWatchlist({
        required this.watched,
        required this.title,
        required this.rating,
        required this.releaseDate,
        required this.review,
    });

    bool watched;
    String title;
    String rating;
    String releaseDate;
    String review;

    factory MyWatchlist.fromJson(Map<String, dynamic> json) => MyWatchlist(
        watched: json["watched"],
        title: json["title"],
        rating: json["rating"],
        releaseDate: json["release_date"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
    };
}
```

5. Menambahkan implementasi `Future` dan `FutureBuilder` pada file `show_watchlist.dart` ditambahkan dengan implementasi `ListView.builder` untuk melakukan fetch pada data yang berada pada `https://pbptugastiga.herokuapp.com/mywatchlist/json/` dan fungsi `onTap()` untuk mengarahkan routing pada tiap - tiap page yang berisi details => sama seperti Tutorial 8

```Dart
    Future<List<MyWatchlist>> fetchToDo() async
    ...
    FutureBuilder(
            future: fetchToDo(),
    ...
    onTap: () {Navigator.push()}
```

6.  Menambahkan implementasi `Text` dengan skema `Row` dan `Column` pada file `watchlist_detail.dart` ditambahkan dengan implementasi `ElevatedButton` untuk balik kepada page show mywatchlist. `Text` akan mengambil data widget pada list `myWatchlist` dengan memanggil atributnya
```Dart
   child: Text(widget.myWatchlist.review))
``` 

7. Menambahkan `ListTile` pada widget `appdrawer.dart` untuk mengarahkan routing pada page show mywatchlist dan memanggil class-nya pada file `show_watchlist.dart` 

8. Mengimplementasikan soal bonus dengan menambahkan widget `Checkbox` pada file `show_watchlist.dart` dan menambahkan conditionals yang memanggil data bertipe boolean `watched`
