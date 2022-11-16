# Pemrograman Berbasis Platform - Tugas 8

Nama: Calista Vimalametta Heryadi <br>
NPM: 2106630473 <br>
Kelas: C <br>

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