# PRD.md — Product Requirements Document
## Proyek: Web Company Profile Layanan Arisan, Dapin & Kredit Eksklusif

---

## 1. Ringkasan Eksekutif & Tujuan Produk
Dokumen **Product Requirements Document (PRD)** ini mendefinisikan seluruh kebutuhan bisnis, psikologi pengguna, desain visual, konten 11 seksi, dan spesifikasi fitur interaktif untuk **Web Company Profile Layanan Arisan, Dana Pinjaman (Dapin), dan Cicilan/Kredit**.

Tujuan utama produk ini adalah:
1. **Membangun Kepercayaan Instan (*High-Trust Authority*):** Menampilkan citra perusahaan/komunitas arisan yang bonafide, eksklusif, amanah, dan memiliki kepastian hukum melalui perpaduan warna **Abu Mewah**, **Judul Gold Bold**, dan **Teks Isi Putih Bersih**.
2. **Mengedukasi Calon Member Tanpa Kebingungan (*Cognitive Ease*):** Menjelaskan istilah arisan (DPA, UM, Dapin, Japo, Get, Opslot) dan perbandingan 3 skema arisan (Menurun, Tender, Flat) secara transparan dan interaktif.
3. **Mengarahkan Konversi Langsung ke WhatsApp (*Frictionless WA Funnel*):** Memastikan setiap pengunjung yang tertarik dapat langsung terhubung ke WhatsApp Admin dengan pesan yang sudah terformat otomatis sesuai layanan yang dipilih.
4. **Menyajikan Pengalaman Multi-Perangkat & Audio Mewah:** Menyediakan musik latar bernuansa elegan yang dilengkapi tombol UI/UX **Play** dan **Stop**, serta tata letak yang berjalan mulus di **Android, iOS (iPhone/iPad), HP, Tablet, Laptop, dan Desktop**.

---

## 2. Spesifikasi Tema Visual Klien (Mandatory Brand Guidelines)

| Komponen Visual | Ketentuan Wajib Klien | Kode Warna / Spesifikasi Teknis |
| :--- | :--- | :--- |
| **1. Warna Abu Mewah** | Digunakan sebagai latar belakang utama, latar seksi selang-seling, dan kartu konten. | Background Utama: `#1C1D21` (Luxury Charcoal Grey)<br>Background Seksi: `#22242A` (Deep Slate Grey)<br>Background Kartu: `#282A30` (Metallic Slate Grey)<br>Border: `#3A3D45` & `rgba(212, 175, 55, 0.28)` |
| **2. Tulisan Gold Bold Judul** | Seluruh judul utama, subjudul (`H1`–`H4`), nomor urut, dan sorotan judul wajib berwarna emas tebal (**Bold**). | Warna Emas Utama: `#D4AF37` (Royal Gold)<br>Warna Emas Terang: `#E6C65A` (Champagne Gold)<br>Ketebalan: `font-weight: 700` s/d `800` (**Bold / ExtraBold**)<br>Font Family: `Playfair Display` (Serif Mewah) |
| **3. Putih untuk Teks Lainnya** | Seluruh teks paragraf, tabel, syarat & ketentuan, serta jawaban FAQ wajib berwarna putih bersih. | Teks Utama: `#FFFFFF` (Pure Crisp White)<br>Teks Sub-label: `#EAECEF` (Pearl White)<br>Font Family: `Plus Jakarta Sans` atau `Inter` |

---

## 3. Persyaratan Fungsional Utama (Core Functional Requirements)

### FR-01: Integrasi Langsung ke WhatsApp (`wa.me`)
* Website wajib memiliki sistem penghubung langsung ke WhatsApp Admin (`https://wa.me/<nomor_wa>?text=<pesan_terenkode>`).
* Tersedia input pengaturan nomor WhatsApp Admin di bilah atas (untuk memudahkan pergantian nomor) serta tombol **Floating Chat WA** di kanan bawah layar.
* Setiap seksi layanan memiliki tombol CTA WhatsApp kontekstual (Daftar Member Baru, Cek Opslot Arisan Menurun/Tender/Flat, Konfirmasi Bukti Pembayaran, Pengajuan Dapin, Tanya Katalog Kredit, dan Kirim Formulir Pendaftaran).

### FR-02: Musik Background dengan Tombol UI/UX Play & Stop
* Website wajib menyediakan komponen kontrol musik latar di bilah navigasi atas dan bagian footer.
* Komponen UI/UX wajib memiliki:
  1. Tombol **Play (`▶ Play`)** yang langsung memutar alunan musik latar *ambient luxury* disertai animasi indikator *equalizer* emas.
  2. Tombol **Stop (`■ Stop`)** yang langsung menghentikan musik latar dan mereset status pemutaran.
  3. Indikator teks status musik (`"🎵 Musik Latar: Sedang Diputar"` / `"🎵 Musik Latar: Berhenti"`).
* Implementasi audio wajib mematuhi kebijakan *user-gesture autoplay* pada browser mobile **iOS Safari** dan **Android Chrome** (menggunakan Web Audio API atau HTML5 Audio yang dipicu klik pengguna tanpa menyebabkan *error* konsol).

### FR-03: Arsitektur Psikologi Pengguna (Persuasive & User-Friendly Flow)
* **0–5 Detik Pertama (Attention & Trust):** Menampilkan *Trust Badges* (`Seleksi KYC Berlapis`, `Pencairan 100% Tepat Jadwal`, `Rekening Resmi`) dan **Kompas Navigasi Cepat** (*"Pilih Tujuan Finansial Anda"*) di Beranda agar pengguna langsung merasa terarah.
* **Kemudahan Kognitif (Understanding):** Menyediakan fitur pencarian instan pada **Kamus Arisan**, **Generator Berita Transfer** pada Seksi Pembayaran, serta **Kalkulator Simulasi Interaktif** pada Seksi Jenis-Jenis Arisan.
* **Kepastian Hukum (Risk Reduction):** Menyajikan S&K Arisan, S&K Dapin, S&K Kredit, dan Rules secara terstruktur dalam kartu-kartu bernomor tegas.
* **Tindakan Cepat (Action):** Menyediakan peta 6 langkah mudah yang berdampingan langsung dengan **Formulir Pendaftaran Cepat ke WhatsApp**.

### FR-04: Kompatibilitas Lintas Perangkat (Cross-Platform Responsiveness)
* Wajib tampil proporsional dan nyaman digunakan di:
  * **Android & iOS (Smartphone):** `< 640px` (1 kolom, menu *drawer* mobile, tabel *horizontal scroll*, tombol minimal `44x44px`).
  * **Tablet / iPad:** `640px – 1024px` (2 kolom proporsional).
  * **Laptop & Monitor Desktop:** `> 1024px` (3–4 kolom proporsional, navigasi lengkap 11 seksi).

---

## 4. Alur & Naskah Konten Lengkap 11 Seksi (Mandatory Content Flow)

### Seksi 1 — Beranda
* **Headline Utama (Gold Bold - H1):** `SOLUSI ARISAN EKSKLUSIF, PENDANAAN DAPIN, & KREDIT AMANAH DENGAN MANAJEMEN TRANSPARAN`
* **Sub-Headline (Teks Putih):** Wujudkan perencanaan tabungan berjangka, kebutuhan modal usaha, dan pengadaan barang impian Anda bersama komunitas yang dikelola secara profesional. Setiap peserta diverifikasi ketat sehingga pencairan dijamin 100% tepat waktu.
* **Kompas Navigasi Cepat:** 4 tombol pengarah langsung ke (1) Jenis Arisan, (2) Layanan Dapin, (3) Program Cicilan/Kredit, dan (4) Kamus Arisan.
* **4 Pilar Keunggulan:**
  1. **Verifikasi Identitas Ketat:** Setiap calon anggota melewati validasi KTP, domisili, dan kontak darurat keluarga.
  2. **Pencairan 100% Tepat Waktu:** Jaminan pencairan dana (*Get*) sesuai jadwal melalui dukungan sistem manajemen Dana Talangan (*Cover*) Owner.
  3. **Pilihan Layanan Lengkap:** Tersedia Arisan Menurun, Arisan Tender, Arisan Flat, layanan Dapin, hingga Cicilan/Kredit barang.
  4. **Rekapitulasi Transparan:** Seluruh jadwal Japo, bukti setoran, dan urutan penerima dana tercatat rapi di grup resmi.

### Seksi 2 — Tentang Arisan
* **Judul Seksi (Gold Bold - H2):** `TENTANG KAMI & KOMITMEN MANAJEMEN PROFESIONAL`
* **Narasi Profil (Teks Putih):** Kami hadir sebagai wadah perencanaan keuangan berbasis komunitas yang memodernisasi tradisi arisan menjadi lebih terstruktur, aman, dan memiliki kepastian hukum. Didukung pencatatan digital dan seleksi keanggotaan berlapis, kami membantu setiap anggota mencapai target finansial dengan tenang.
* **4 Kartu Visi & Misi:**
  1. **Visi Layanan Eksklusif:** Menjadi platform komunitas arisan, pendanaan mikro (Dapin), dan cicilan paling amanah serta profesional yang mengedepankan integritas dan ketepatan waktu.
  2. **Misi Keamanan Berlapis (Know Your Member):** Menerapkan standar verifikasi data identitas dan surat perjanjian tertulis guna melindungi hak finansial seluruh anggota maupun pengelola.
  3. **Misi Transparansi Finansial:** Menyajikan rincian biaya administrasi, tabel setoran, aturan DPA, serta jadwal pencairan secara terbuka sejak awal.
  4. **Misi Pendampingan Responsif:** Memberikan layanan konsultasi cepat melalui WhatsApp Admin resmi mulai dari pemilihan kloter hingga pencairan selesai.

### Seksi 3 — Kamus Arisan (10 Istilah Wajib + Fitur Pencarian & Filter)
* **Judul Seksi (Gold Bold - H2):** `KAMUS ISTILAH ARISAN, DAPIN & KREDIT (DPA, UM, JAPO, DLL)`
* **Daftar 10 Istilah Wajib:**
  1. **DPA (Deposit Akhir):** Dana jaminan komitmen yang dibayarkan di awal pendaftaran (atau ditahan dari pencairan) dan otomatis digunakan untuk melunasi setoran peserta pada putaran Jatuh Tempo (Japo) paling akhir.
  2. **UM (Uang Muka / Uang Masuk / Upah Member):** Pada program Cicilan/Kredit berarti Uang Muka (*Down Payment*) tanda jadi pemesanan barang; pada kloter arisan tertentu merujuk pada Uang Masuk registrasi atau Upah Member.
  3. **Dapin (Dana Pinjaman):** Fasilitas pinjaman dana tunai jangka pendek khusus bagi member terverifikasi dengan ketentuan plafon, tenor, dan jasa layanan yang transparan sesuai akad.
  4. **Japo (Jatuh Tempo):** Batas tanggal dan jam maksimal pembayaran: Semua aktifitas japo clear 18:00, Closing global 19:00.
  5. **Get (Nominal / Giliran Pencairan):** Jumlah total dana arisan yang diterima oleh peserta pada saat gilirannya tiba, atau merujuk pada jadwal tanggal turunnya pencairan dana arisan.
  6. **Kloter (Kelompok Putaran Arisan):** Satu grup putaran arisan yang memiliki nilai Get, periode waktu (mingguan/bulanan), dan jumlah slot tertentu dari putaran pertama hingga selesai.
  7. **Slot / Opslot (Nomor Urut / Open Slot):** Posisi nomor urut kepesertaan di dalam sebuah kloter. Istilah *Opslot* berarti masih tersedia nomor urut kosong yang siap diambil oleh calon peserta.
  8. **Oper Slot (Pengalihan Kepemilikan Slot):** Prosedur resmi pemindahtanganan slot arisan yang sedang berjalan (sebelum menerima Get) kepada anggota pengganti atas persetujuan dan verifikasi Admin/Owner.
  9. **Cover / Talangan (Dana Talangan Pengelola):** Mekanisme jaminan dari manajemen untuk memastikan penerima Get tetap menerima pencairan 100% tepat jadwal meskipun ada peserta lain yang sedang ditagih keterlambatannya.
  10. **Owner / Admin (Pengelola Resmi Komunitas):** Pihak manajemen resmi yang bertanggung jawab melakukan seleksi KYC anggota, mencatat rekapitulasi pembayaran, mengelola grup kloter, dan menyalurkan dana Get.

### Seksi 4 — Pembayaran (Keterangan Arisan, Dapin & Kredit + Generator Berita Transfer)
* **Judul Seksi (Gold Bold - H2):** `INFORMASI REKENING & KETERANGAN PEMBAYARAN (ARISAN, DAPIN, KREDIT)`
* **Fitur Kartu Rekening Resmi:** Menampilkan kartu rekening resmi (1. Khusus Arisan: Bank BCA 4160779522 a.n Ni Made Juwita Dewi, 2. Khusus Dapin & Cicilan: Bank BRI 800801010011532 a.n Ni Made Juwita Dewi, rekening lainnya menyusul) serta tombol **Salin Nomor Rekening** dan konfirmasi bukti transfer via WhatsApp Official (087849772212) & Admin (081558200065).
* **Tabel Keterangan & Generator Berita Transfer:**
  * **Setoran Arisan & DPA:** Semua aktifitas japo clear 18:00, Closing global 19:00. Format: `ARISAN - [Kloter] - [Slot] - [Nama]`.
  * **Pelunasan Dapin:** Sesuai tanggal jatuh tempo tenor akad Dapin. Format: `DAPIN - [Kode Pinjaman] - [Nama]`.
  * **Angsuran Cicil / Kredit & UM:** Sesuai tanggal angsuran di kartu kontrol kredit. Format: `KREDIT - [Barang] - [Ke-X] - [Nama]`.

### Seksi 5 — Jenis-Jenis Arisan (Menurun, Tender, Flat) + Penjelasan & Simulator
* **Judul Seksi (Gold Bold - H2):** `3 JENIS ARISAN (MENURUN, TENDER, FLAT) BESERTA PENJELASAN & SIMULASI`
* **1. Arisan Menurun (Setoran Sesuai Nomor Urut Slot):**
  * **Slot Urutan Atas (Cair Awal):** Setoran lebih tinggi karena menerima dana Get lebih cepat untuk modal atau kebutuhan segera.
  * **Slot Urutan Bawah (Cair Akhir):** Setoran semakin ringan setiap nomornya, sehingga total uang yang disetor lebih kecil daripada nilai Get yang diterima (untung tabungan).
  * **Sifat Setoran:** Tetap untuk masing-masing individu dari putaran pertama hingga selesai sesuai slot yang dikunci.
* **2. Arisan Tender / Lelang (Pencairan Fleksibel Sistem Penawaran):**
  * **Mekanisme Lelang:** Setiap periode penarikan, peserta yang membutuhkan dana dapat mengajukan tawaran potongan (*bid*) tertinggi.
  * **Pemenang Tender:** Penawar tertinggi berhak menerima pencairan Get pada periode tersebut (dikurangi nilai tawaran tender).
  * **Bagi Hasil Diskon:** Selisih potongan tender pemenang dibagikan untuk meringankan setoran peserta lain di kloter yang sama.
* **3. Arisan Flat / Tetap (Setoran Sama Rata Seluruh Peserta):**
  * **Setoran Rata:** Tidak ada perbedaan nominal iuran antara penerima urutan awal maupun urutan akhir.
  * **Penentuan Giliran:** Dilakukan melalui pengundian (kocokan transparan) setiap periode atau urutan yang disepakati di awal kloter.
  * **Perencanaan Pasti:** Cocok untuk tabungan disiplin bulanan atau mingguan dengan anggaran tetap.
* **Fitur Tambahan Wajib:** Tabel perbandingan 3 jenis arisan & **Kalkulator Simulasi Interaktif** (pilihan nominal Get & slider nomor slot 1–10).

### Seksi 6 — Syarat & Ketentuan Arisan
* **Judul Seksi (Gold Bold - H2):** `SYARAT & KETENTUAN KEANGGOTAAN ARISAN RESMI`
* Mencakup 4 kartu ketentuan: (1) Persyaratan Identitas & Verifikasi Data KYC, (2) Pemilihan Slot & Ketentuan DPA, (3) Kewajiban Pembayaran Setoran & Pencairan Get, serta (4) Larangan Cancel Sepihak & Prosedur Oper Slot.

### Seksi 7 — Syarat & Ketentuan Dapin (Dana Pinjaman)
* **Judul Seksi (Gold Bold - H2):** `SYARAT & KETENTUAN LAYANAN DAPIN (DANA PINJAMAN)`
* Mencakup 4 kartu ketentuan: (1) Kelayakan Pemohon (prioritas member aktif / verifikasi slip gaji & mutasi usaha), (2) Plafon, Tenor & Jasa Layanan Transparan, (3) Agunan Slot Arisan Aktif (hak potong otomatis jika gagal bayar), dan (4) Ketentuan Jatuh Tempo & Denda Harian.

### Seksi 8 — Syarat & Ketentuan Cicil / Kredit
* **Judul Seksi (Gold Bold - H2):** `SYARAT & KETENTUAN PROGRAM CICILAN / KREDIT BARANG & EMAS`
* Mencakup 3 kartu ketentuan: (1) Pemesanan & Uang Muka / UM (*Down Payment* mengikat), (2) Jadwal Angsuran & Ketentuan Serah Terima Fisik Barang, dan (3) Sanksi Keterlambatan & Hak Penarikan Kembali Objek Kredit.

### Seksi 9 — Rules (Peraturan Umum & Tata Tertib Komunitas)
* **Judul Seksi (Gold Bold - H2):** `PERATURAN UMUM & TATA TERTIB MEMBER (RULES)`
* Mencakup 5 peraturan utama:
  * **RULE 01:** Wajib Aktif & Responsif di grup WhatsApp terutama menjelang tanggal Japo.
  * **RULE 02:** Wajib Lapor Perubahan Data (nomor HP/WA, rekening, atau alamat) maksimal 1x24 jam.
  * **RULE 03:** Larangan Transaksi Bawah Tangan (pinjam-meminjam pribadi atau oper slot tanpa izin Admin).
  * **RULE 04:** Etika & Kerahasiaan Grup (menjaga kesopanan dan dilarang menyebarkan data pribadi anggota).
  * **RULE 05:** Sanksi Denda, Blacklist Komunitas & Tindak Lanjut Hukum Perdata/Pidana atas wanprestasi.

### Seksi 10 — Cara Mengikuti Arisan (6 Langkah + Formulir Pendaftaran Cepat WA)
* **Judul Seksi (Gold Bold - H2):** `6 LANGKAH MUDAH MENGIKUTI ARISAN & FORMULIR PENDAFTARAN WA`
* Menampilkan 6 langkah berurutan (Pilih Layanan → Konsultasi Opslot via WA → Verifikasi KYC → Setujui Akad & Bayar DPA/UM → Masuk Grup Resmi → Setor Rutin & Terima Get) berdampingan dengan **Formulir Pendaftaran Cepat** yang langsung mengirim data ke WhatsApp Admin.

### Seksi 11 — FAQ (Pertanyaan yang Sering Diajukan)
* **Judul Seksi (Gold Bold - H2):** `PERTANYAAN YANG SERING DIAJUKAN (FAQ)`
* Komponen *Accordion* interaktif berisi 6 tanya-jawab utama (Jaminan keamanan & Cover, Perbedaan DPA vs Admin, Aturan member baru ambil slot atas, Prosedur Oper Slot jika darurat, Cara ajukan Dapin/Kredit, dan Dukungan akses di Android/iOS/Desktop) ditutup dengan banner CTA WhatsApp.
