# Pemrograman Berbasis Platform - Tugas Flutter

Nama: Calista Vimalametta Heryadi <br>
NPM: 2106630473 <br>
Kelas: C <br>

---

# Tugas 7

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

---

# Tugas 8

## Navigator.push dan Navigator.pushReplacement

`Navigator.push` melakukan navigasi ke suatu halaman dengan menambahkan (`push`) halaman tersebut pada stack. `Navigator.pushReplacement` melakukan hal yang sama, dengan tambahan halaman yang ditempati sebelum push dihapus (`pop`) dari stack sebelum menambahkan halaman baru. Contoh:

* path awal: /A/B/C/
* path setelah `Navigator.push`: /A/B/C/D
* path setelah `Navigator.pushReplacement`: /A/B/D

## Widget yang Digunakan

1. `MyFormPage`: stateful widget kustom untuk menampilkan halaman form.
2. `Form`: 
3. `SingleChildScrollView`: memungkinkan childnya dapat di-scroll.
4. `TextFormField`: isian form yang menerima input karakter.
5. `DropdownButtonFormField`: isian form yang menerima satu dari semua pilihan yang disediakan `DropdownMenuItem` (pilihan diakses dengan menekan tombol).
7. `TextButton`: tombol yang dapat diberikan keterangan `Text`.
8. `MyDataPage`: stateless widget kustom untuk menampilkan halaman penyajian data.
9. `ListView`: memungkinkan child-childnya dapat di-scroll, memiliki function `builder` yang melakukan looping untuk membuat child tiap object dalam suatu iterable.
10. `Card`: layout berbentuk kartu (sudah memiliki border).
11. `ListTile`: layout mirip Row yang dapat menampung widget di kiri/`leading` dan kanan/`trailing`.
12. `MyDrawer`: stateless widget kustom untuk menampilkan drawer.
13. `Drawer`: membuat tombol hamburger (jika dimasukkan dalam `drawer` `Scaffold`) yang menampilkan side bar kiri.

## Event Flutter

1. `onTap`: event disebabkan user menekan widget (umumnya selain tombol).
2. `onPressed`: event disebabkan user menekan widget (umumnya untuk tombol).
3. `onChanged`: event disebabkan user mengganti nilai isian form.
4. `onSaved`: event disebabkan `_formKey.currentState.save()` (user mengumpulkan form).

## Cara Kerja Navigator

`Navigator` menyimpan halaman-halaman yang terbuka pada aplikasi Flutter sebagai stack berisi object `Route` (path ke masing-masing halaman). Halaman teratas dari stack adalah halaman yang sedang ditempati. Operasi `Navigator` seperti `.push`, `.pop`, dan `.pushReplacement` (gabungan `.pop` dan `.push`) melalukan operasi pada stack untuk menavigasi dari satu halaman ke halaman lain.

## Implementasi Tugas 8

### lib/main.dart:
1. Membuat class `Budget` yang memiliki properti bertipe `String`, `amount`, dan `type`.
2. Membuat list kosong `budgetList` yang akan menampung object `Budget` nanti sebagai state `MyApp`.
3. Membuat function `addBudget` yang menambahkan object `Budget` ke dalam `budgetList` di dalam `MyApp`.
4. Membuat `MyHomePage` menerima `budgetList` dan `addBudget` dalam inisialisasinya.
### lib:
5. Membuat tiga file .dart baru: `form.dart`, `data.dart`, dan `drawer.dart`.
### lib/form.dart:
6. Membuat stateful widget `MyFormPage` yang menerima `budgetList` dan `addBudget` dalam inisialisasinya.
7. Membuat state-state `MyFormPage` yaitu: `_formKey`, `formTitle`, `formAmount`, `formType` (pilihan nilainya dalam `typeList`).
8. Membangun tampilan `MyFormPage` dengan:
    * Menambahkan `appBar`.
    * Menyusun `body` dengan widget `Form` dan `SingleChildScrollView`.
    * Menambahkan isian-isian form:
        * `TextFormField` untuk mengubah state `formTitle`.
        * `TextFormField` dengan input angka saja untuk mengubah state `formAmount`.
        * `DropDownButtonFormField` untuk mengubah state `formType` dengan pilihan yang ada di `typeList`.
    * Menambahkan `TextButton` yang memanggil `addBudget` untuk memasukkan hasil isian form ke dalam list.

### lib/data.dart:
9. Membuat stateless widget `MyDataPage` yang menerima `budgetList` dan `addBudget` dalam inisialisasinya.
10. Membangun tampilan `MyDataPage` dengan:
    * Menambahkan `appBar`.
    * Menyusun `body` dengan widget `ListView.builder`.
    * Membuat function yang menampilkan widget `Card` untuk tiap object `Budget` dalam `budgetList` dengan isi:
        * `ListTile` dengan `title` untuk menampilkan `title`.
        * `ListTile` dengan `leading` untuk menampilkan `amount` dan `trailing` untuk menampilkan `type`.

### lib/drawer.dart:
11. Membuat stateless widget `MyDrawer` yang menerima `budgetList` dan `addBudget` dalam inisialisasinya.
12. Membangun tampilan `MyDrawer` dengan `ListTile` yang memanggil `MyHomePage`, `MyFormPage`, dan `MyDataPage`
    (masing-masing halaman disertai `budgetList` dan `addBudget`).

### lib/main.dart, lib/form.dart, lib/data.dart:
13. Memanggil `MyDrawer` dalam `drawer` `MyHomePage`, `MyFormPage`, dan `MyDataPage` (disertai `budgetList` dan `addBudget`).

---

# Tugas 9

## Pengambilan Data JSON tanpa Membuat Model

Pengambilan data JSON tanpa model (inline) dapat dilakukan. Function `jsonDecode` dipanggil untuk mengembalikan object `Map<String, dynamic>`, kemudian data diakses seperti map biasa. Namun pengambilan dengan model lebih disarankan karena type data tidak diketahui hingga runtime (`dynamic`), yang membuat kode rentan terkena error.

## Widget Baru yang Digunakan

1. `MyWatchlistPage`: ekstensi stateful widget untuk menampilkan halaman daftar film.
2. `FutureBuilder`: membangun widget lain setelah mendapatkan data dari asynchronous function. 
3. `CircularProgressIndicator`: menampilkan icon loading selama aplikasi mengambil data.
4. `InkWell`: layout yang memiliki touch response, dapat berfungsi sebagai tombol.
5. `WatchlistDetailsPage`: ekstensi stateless widget untuk menampilkan halaman detail film.
6. `RichText`: menampung widget TextSpan.
7. `TextSpan`: dapat menampung beberapa (widget) text dengan style yang berbeda-beda.
8. `ElevatedButton`: tombol yang 'muncul' (elevated) ketika ditekan.

## Mekanisme Pengambilan Data JSON

Widget `FutureBuilder` memanggil function `fetchMyWatchlist` yang sudah dibuat di widget page. Function tersebut mengambil data dari [endpoint JSON Heroku Tugas 3](https://tgs-pbp.herokuapp.com/mywatchlist/json/), lalu membuat instance model `MyWatchlist` dari data, dan memasukkan instance model ke list. Selama data belum didapatkan, `builder` menunjukkan `CircularProgressIndicator`. Ketika data sudah didapatkan, `builder` membangun `ListView` untuk menampilkan data. Data dipanggil dengan `snapshot.data![index].<property>` seperti memanggil class.

## Implementasi Tugas 9

### lib:

1. Membuat folder `model` dan `page` serta memindahkan semua file `.dart` selain `main.dart` ke `page`.
2. Membuat file `mywatchlist.dart` di dalam `model`, kemudian `mywatchlist_page.dart` dan `watchlist_details.dart` di dalam `page`.

### lib/model/mywatchlist.dart:

3. Menyalin data dari [endpoint JSON Heroku Tugas 3](https://tgs-pbp.herokuapp.com/mywatchlist/json/) ke situs [QuickType](https://app.quicktype.io/).
4. Menempel kode Dart hasil konversi ke `mywatchlist.dart` dan melakukan beberapa perubahan.

### android/app/src/main/AndroidManifest.xml:

5. Menambah tag `uses-permission` di `AndroidManifest.xml` untuk mengizinkan akses Internet di Android.

### lib/page/mywatchlist_page.dart:

6. Memasukkan perintah `flutter pub add http` di `cmd` path project Flutter untuk menambahkan package `http`.
7. Menambah import, kemudian stateful widget `MyWatchlistPage` dengan state berisi function untuk mengambil data JSON dari [endpoint JSON Heroku Tugas 3](https://tgs-pbp.herokuapp.com/mywatchlist/json/).
8. Membangun `Scaffold` dengan fitur `appBar`, `drawer`, dan `body` dengan widget `FutureBuilder`, `ListView.builder`, dan `InkWell` untuk mendaftarkan judul film.

### lib/page/watchlist_details.dart:

9. Menambah import, kemudian stateless widget `WatchlistDetailsPage` yang menerima detail film.
10. Membangun `Scaffold` dengan fitur `appBar`, `drawer`, dan `body` dengan widget `RichText` dan `TextSpan` untuk mendaftarkan detail film.
11. Membuat dan menggunakan function `convertStatus()` untuk mengubah string status dari `Yes`/`No` ke `Watched`/`Haven't watched`.
12. Menambah fitur `bottomSheet` dengan `ElevatedButton` untuk kembali ke `MyWatchlistPage`.

### lib/page/mywatchlist_page.dart:

13. Membuat judul film dapat ditekan untuk navigasi ke  `WatchlistDetailsPage` dengan passing detail film tersebut.

### lib/page/drawer.dart:

14. Menambah widget `ListTile` untuk navigasi ke `MyWatchlistPage`.