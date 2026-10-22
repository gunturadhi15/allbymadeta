# TODO.md — Step-by-Step Task Execution Checklist (Antigravity Task Tracker)

Gunakan daftar tugas ini sebagai panduan eksekusi berurutan di Antigravity. Tandai setiap item (`- [x]`) setelah diimplementasikan dan diverifikasi sesuai kriteria selesai (*Definition of Done*).

---

## Fase 1: Setup Pondasi Proyek & Sistem Desain Tema Klien
- [x] **Task 1.1 — Konfigurasi Dokumen HTML5 & Meta Viewport Lintas Perangkat**
  * Tambahkan `<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />` untuk kompatibilitas layar penuh di Android, iOS (iPhone/iPad), Laptop, dan Desktop.
  * Muat CDN Tailwind CSS (`https://cdn.tailwindcss.com/3.4.17`) dan Google Fonts (`Playfair Display` untuk judul Gold Bold & `Plus Jakarta Sans` untuk teks putih).
- [x] **Task 1.2 — Implementasi Variabel CSS & Kelas Utilitas Tema Klien**
  * Tetapkan variabel warna **Abu Mewah** (`--bg-luxury-primary: #1C1D21`, `--bg-luxury-secondary: #24262C`, `--bg-luxury-card: #282A30`, `--border-luxury-grey: #3A3D45`).
  * Tetapkan variabel **Tulisan Gold Bold Judul** (`--heading-gold-primary: #D4AF37`, `--heading-gold-light: #E6C65A`, `font-weight: 700–800`).
  * Tetapkan variabel **Teks Putih Bersih** (`--text-white-primary: #FFFFFF`).
  * Buat kelas `.luxury-card`, `.gold-heading`, `.gold-btn`, dan `.wa-btn`.

---

## Fase 2: Navigasi Responsif, Simulasi Layar & Sistem Audio (Play / Stop)
- [x] **Task 2.1 — Pembuatan Bilah Utilitas Atas (Simulasi Perangkat & Konfigurasi Nomor WA)**
  * Buat tombol penguji tampilan layar: `Desktop / Laptop`, `Tablet / iPad`, dan `HP (Android / iOS)` agar klien dapat melihat responsivitas secara langsung.
  * Buat input `#inputWaNumber` dan tombol `#btnSaveWa` untuk mengatur nomor WhatsApp Admin resmi.
- [x] **Task 2.2 — Pembuatan Header Sticky, Navigasi 11 Seksi & Mobile Drawer**
  * Buat navigasi desktop untuk Seksi 1–11 dan tombol menu mobile (`#btnToggleMobileMenu`) yang membuka panel `#mobileMenuDrawer`.
  * Tambahkan **Bilah Panduan Alur Terarah** di bawah header untuk mengarahkan psikologi pengguna (`Kenali Kami → Pahami Istilah & Skema → Cek Keamanan & S&K → Gabung via WA`).
- [x] **Task 2.3 — Implementasi Musik Background & Tombol UI/UX Play dan Stop**
  * Buat komponen UI/UX pengontrol musik dengan indikator 4 bar equalizer emas (`#eqVisualizer`), tombol **Play (`#btnMusicPlay`)**, dan tombol **Stop (`#btnMusicStop`)** di Header serta Footer.
  * Implementasikan fungsi `startBackgroundMusic()` dan `stopBackgroundMusic()` berbasis Web Audio API yang aman terhadap kebijakan *autoplay* di Safari iOS dan Chrome Android.

---

## Fase 3: Implementasi Seksi 1 s/d Seksi 5 (Awareness, Edukasi & Simulasi)
- [x] **Task 3.1 — Seksi 1: Beranda (`#seksi-1`)**
  * Bangun Hero Section dengan *Trust Badge*, judul H1 Gold Bold, deskripsi putih bersih, tombol CTA WhatsApp, tombol putar musik latar, dan 3 kartu metrik utama.
  * Bangun komponen **Kompas Navigasi Cepat** (*"Pilih Tujuan Finansial Anda"*) yang menghubungkan pengguna langsung ke Seksi 5, Seksi 7, Seksi 8, atau Seksi 3.
  * Bangun 4 kartu **Pilar Keunggulan** (Verifikasi Identitas Ketat, Pencairan 100% Tepat Waktu, Pilihan Layanan Lengkap, Rekapitulasi Transparan).
- [x] **Task 3.2 — Seksi 2: Tentang Arisan (`#seksi-2`)**
  * Tampilkan profil manajemen dan 4 kartu komitmen (Visi Layanan Eksklusif, Misi Keamanan KYC, Misi Transparansi Finansial, Misi Pendampingan Responsif) beserta tombol pengarah ke Seksi 3.
- [x] **Task 3.3 — Seksi 3: Kamus Arisan Interaktif (`#seksi-3`)**
  * Muat 10 istilah wajib: **DPA, UM, Dapin, Japo, Get, Kloter, Slot/Opslot, Oper Slot, Cover/Talangan, Owner/Admin**.
  * Hubungkan input pencarian `#inputSearchKamus` dan dropdown filter `#selectFilterKamus` ke fungsi `renderKamus()`.
- [x] **Task 3.4 — Seksi 4: Pembayaran Resmi & Generator Berita Transfer (`#seksi-4`)**
  * Buat 4 kartu rekening resmi (BCA, Mandiri, BRI/SeaBank, E-Wallet) lengkap dengan tombol **Salin No. Rekening** (`copyTextToClipboard`).
  * Buat tabel keterangan pembayaran untuk Arisan, Dapin, dan Cicilan/Kredit.
  * Bangun **Generator Berita Transfer & Konfirmasi WA** (`updatePaymentNote()`) yang memformat berita transfer otomatis dan mengirimkannya ke WhatsApp Admin.
- [x] **Task 3.5 — Seksi 5: Jenis-Jenis Arisan & Kalkulator Simulasi (`#seksi-5`)**
  * Buat 3 kartu penjelasan lengkap untuk **1. Arisan Menurun**, **2. Arisan Tender (Lelang)**, dan **3. Arisan Flat (Tetap)**, masing-masing dilengkapi tombol cek Opslot via WhatsApp.
  * Bangun **Simulator Interaktif Arisan** (`updateArisanSimulator()`) dengan tab pilihan mode (*Menurun, Tender, Flat*), pilihan nominal Get (`10 Juta, 20 Juta, 50 Juta`), dan slider nomor urut slot (`Slot #1` s/d `Slot #10`).
  * Buat Tabel Perbandingan Ketiga Jenis Arisan.

---

## Fase 4: Implementasi Seksi 6 s/d Seksi 11 (Kepastian Hukum, Rules & Konversi)
- [x] **Task 4.1 — Seksi 6: Syarat & Ketentuan Arisan (`#seksi-6`)**
  * Buat 4 kartu ketentuan: Verifikasi Data KYC, Pemilihan Slot & DPA, Kewajiban Setoran & Get, serta Larangan Cancel Sepihak & Oper Slot.
- [x] **Task 4.2 — Seksi 7: Syarat & Ketentuan Dapin (`#seksi-7`)**
  * Buat 4 kartu ketentuan Dana Pinjaman (Kelayakan Pemohon, Plafon/Tenor/Jasa, Agunan Slot Arisan, Ketentuan Jatuh Tempo) beserta tombol konsultasi Dapin via WhatsApp.
- [x] **Task 4.3 — Seksi 8: Syarat & Ketentuan Cicil / Kredit (`#seksi-8`)**
  * Buat 3 kartu ketentuan program kredit barang/emas (Pemesanan & Uang Muka/UM, Jadwal Angsuran & Serah Terima, Sanksi Keterlambatan) beserta tombol tanya katalog via WhatsApp.
- [x] **Task 4.4 — Seksi 9: Rules Komunitas (`#seksi-9`)**
  * Buat 5 kartu peraturan bernomor emas tebal (`RULE 01` s/d `RULE 05`) yang mencakup kewajiban aktif, lapor perubahan data 1x24 jam, larangan transaksi bawah tangan, etika grup, dan sanksi denda/blacklist/hukum.
- [x] **Task 4.5 — Seksi 10: Cara Mengikuti Arisan & Formulir Pendaftaran WA (`#seksi-10`)**
  * Buat 6 kartu langkah pendaftaran berurutan (`LANGKAH 01` s/d `LANGKAH 06`).
  * Buat **Formulir Pendaftaran Cepat Member** (`#regName`, `#regCity`, `#regService`, `#regTarget`) yang saat diklik (`#btnSubmitRegWa`) langsung mengirim draf pendaftaran ke WhatsApp Admin.
- [x] **Task 4.6 — Seksi 11: FAQ Interaktif & Banner Penutup (`#seksi-11`)**
  * Render 6 item *Accordion* FAQ (`renderFaq()`) yang dapat dibuka-tutup secara interaktif.
  * Buat banner penutup konversi WhatsApp, Footer, tombol *Floating WhatsApp* (`#btnFloatingWa`), dan komponen `#toastBox`.

---

## Fase 5: Audit Kualitas & Verifikasi Akhir (QA Gate)
- [x] **Task 5.1 — Verifikasi Warna & Tipografi:** Pastikan 100% judul berwarna Gold Bold (`#D4AF37`), latar Abu Mewah (`#1C1D21` / `#282A30`), dan teks isi Putih Bersih (`#FFFFFF`).
- [x] **Task 5.2 — Verifikasi Interaktivitas & Anti-Bug:** Pastikan seluruh tombol Play/Stop musik, tombol WhatsApp, tombol salin rekening, pencarian kamus, simulator arisan, dan FAQ berjalan tanpa *error* konsol.
- [x] **Task 5.3 — Verifikasi Responsivitas Multi-Device:** Pastikan tampilan di Android, iOS, HP, Tablet, Laptop, dan Desktop bebas *horizontal overflow*.
