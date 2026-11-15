====================================================================
PANDUAN TUKAR BAHASA WPS OFFICE PC LEVEL (CN KE EN)
Peranti : Xiaomi Pad 6 (Root)
Ciri    : Bahasa Inggeris (en_US) + Mod Tab Campur (Word/Sheet/PPT)
====================================================================

1. KEPERLUAN SEBELUM MULA
--------------------------------------------------------------------
* Tablet sudah Root (Magisk / KernelSU / APatch).
* Aplikasi WPS Office PC Level (com.xiaomi.wpslauncher) sudah dipasang.
* Aplikasi Termux sudah dipasang (guna versi rasmi F-Droid / GitHub,
  elakkan versi lama daripada Google Play Store).
* Fail skrip 'wps_en_manager.sh' telah disimpan di dalam folder
  Download (/sdcard/Download/).


2. LANGKAH-LANGKAH PENGGUNAAN
--------------------------------------------------------------------
[Langkah 1] Aktifkan Container WPS
  Buka aplikasi WPS Office PC sekali, buka satu dokumen kosong, dan
  biarkan aplikasi terbuka di latar belakang (background) supaya
  sistem fail container diaktifkan.

[Langkah 2] Buka Termux & Jalankan Skrip
  Buka aplikasi Termux, taip perintah di bawah dan tekan Enter:

      sh /sdcard/Download/wps_en_manager.sh

  *Nota Penting: Wajib guna 'sh' di hadapan. Jangan guna './' kerana
   folder Download Android menyekat pelaksanaan fail secara terus.

[Langkah 3] Luluskan Akses Root
  Tekan 'Grant' apabila pop-up permintaan kebenaran Superuser / Root
  muncul pada skrin.

[Langkah 4] Pilih Tetapan pada Menu
  * Tekan 1 lalu Enter -> Install English + Mod Tab Campur
                         (Word, Sheet, PPT & PDF dalam 1 tetingkap)
  * Tekan 2 lalu Enter -> Uninstall
                         (Pulihkan semula ke bahasa Cina asal)

[Langkah 5] Buka Semula WPS Office PC
  Setelah mesej '[BERJAYA]' dipaparkan di Termux, buka semula
  aplikasi WPS Office PC dari skrin utama. Semua menu kini dalam
  Bahasa Inggeris.


3. PENYELESAIAN MASALAH LAZIM
--------------------------------------------------------------------
* Ralat 'Permission denied':
  Pastikan anda menaip 'sh /sdcard/Download/wps_en_manager.sh' dan
  bukannya './wps_en_manager.sh'.

* Ralat 'Gagal menjumpai Office.conf':
  Buka aplikasi WPS Office PC dahulu, buka 1 fail kosong, biarkan
  terbuka di background, kemudian jalankan semula skrip.

* Paparan masih Bahasa Cina selepas restart:
  Letakkan folder pek bahasa 'en_US' ke dalam '/sdcard/Download/en_US',
  kemudian jalankan semula skrip di Termux dan pilih nombor 1.

* Bahasa bertukar balik ke Cina selepas kemas kini sistem:
  Jalankan semula skrip di Termux dan pilih nombor 1 untuk mengunci
  semula fail konfigurasi.
====================================================================
