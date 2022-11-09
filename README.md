# Pemrograman Berbasis Platform - Tugas 7

Nama: Calista Vimalametta Heryadi <br>
NPM: 2106630473 <br>
Kelas: C <br>

## Stateless dan Stateful Widget

Stateless widget adalah widget yang tidak memiliki state (informasi mengenai widget yang dapat berubah), artinya widget tersebut tidak dapat berubah selama aplikasi berjalan. Stateful widget adalah widget yang dapat berubah jika state widget tersebut berubah dan function `setState()` dijalankan.

## Widget yang Digunakan

1. `MyApp`: widget untuk aplikasi, membangun `MaterialApp` atau widget design serupa.
2. `MaterialApp`: widget yang menandakan aplikasi menggunakan Material Design, tersambung ke `MyHomePage` saat baru dibuka.
3. `MyHomePage`: widget untuk halaman utama aplikasi, membangun `Scaffold`.
4. `Scaffold`: struktur dasar Material Design untuk menempatkan widget-widget visual.
5. `AppBar`: menampilkan bar (umumnya di atas layar) yang dapat memiliki judul dan tombol-tombol.
6. `Center`: membuat widget child tampil di tengah layar.
7. `Column`: membuat widget child tampil dalam satu kolom (menurun).
8. `Text`: menampilkan string yang dapat diberi property `style` seperti ukuran dan warna.
9. `Padding`: memberi jarak antara widget child dan ujung-ujung layar berdasarkan property `padding`.
10. `Row`: membuat widget child tampil dalam satu baris (mendatar).
11. `Visibility`: membuat widget child muncul atau hilang berdasarkan property `visible`.
12. `FloatingActionButton`: menampilkan tombol (umumnya di bawah kanan layar) yang menjalankan kode dalam property `onPressed` saat ditekan.
13. `Icon`: menampilkan gambar icon statis.

## setState()

`setState()` adalah function yang memberitahu framework bahwa ada state stateful widget yang berubah, agar framework menyusun build baru dan memungkinkan perubahan state tampak pada aplikasi. Dokumentasi Flutter menyarankan agar kode perubahan state dimasukkan ke dalam function ini, walaupun sebenarnya state dapat diubah sebelum memanggil `setState()`.

## const dan final

Keyword `const` dan `final` sama-sama digunakan saat mendeklarasi variabel untuk membuat nilainya tetap. Perbedaannya adalah `const` berlaku pada compile time sedangkan `final` berlaku pada run time. Maka, variabel yang nilainya belum diketahui pada compile time tidak dapat menggunakan `const`. Selain itu, object dalam collection `const` tidak boleh diubah, sedangkan object dalam collection `final` (yang sendirinya tidak dideklarasikan `const` atau `final`) dapat berubah.

## Implementasi Tugas 7

### cmd:
1. Buat project Flutter baru bernama counter_7 dengan perintah `flutter create counter_7`.
### lib/main.dart:
2. Ganti `title` dalam pemanggilan `MyHomePage` menjadi `Program Counter`.
3. Buat state boolean `_counterIsZero`.
4. Buat function `_decrementCounter()` yang mengurangi `_counter` sebanyak 1.
5. Buat function `_checkCounter()` yang mengubah `_counterIsZero` dengan ketentuan:
    * `true` jika `_counter` sama dengan 0.
    * `false` jika sebaliknya.
6. Panggil `_checkCounter()_` dalam baris terakhir `_incrementCounter()` dan `_decrementCounter()`.
7. Buat function `_showOddOrEvenText()` yang mengembalikan widget `Text` dengan ketentuan:
    * bertuliskan `GANJIL` dan berwarna biru jika `_counter` bernilai ganjil.
    * bertuliskan `GENAP` dan berwarna merah jika `_counter` bernilai genap.
8. Panggil `_showOddOrEvenText()` dalam `body` menggantikan `Text You have pushed the button this many times:`.
9. Rombak kode `floatingActionButton`:
    * letakkan di bawah layar dengan `FloatingActionButtonLocation:centerDocked`.
    * ganti widget menjadi `Padding` dengan `EdgeInsets.all(...)` agar terdapat jarak antara tombol dan ujung layar.
    * masukkan widget `Row` dalam `Padding` dengan `MainAxisAlignment.spaceBetween` agar tombol dijorokkan ke kiri dan kanan layar.
    * masukkan widget `Visibility` dalam `Row` dengan `_counterIsZero` untuk menentukan kemunculannya.
    * masukkan widget `FloatingActionButton` dalam `Visibility` dengan `_decrementCounter()` sebagai tombol pengurang `_counter`.
    * masukkan widget  `FloatingActionButton` dalam `Row` dengan `_incrementCounter()` sebagai tombol penambah `_counter`.