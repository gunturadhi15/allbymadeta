# ARCHITECTURE.md — System & Technical Architecture
## Proyek: Web Company Profile Layanan Arisan, Dapin & Kredit Eksklusif

Dokumen ini menjelaskan arsitektur teknis, hierarki komponen, manajemen *state*, alur data interaktif, serta spesifikasi responsif lintas perangkat (Android, iOS, HP, Tablet, Laptop, dan Desktop).

---

## 1. Gambaran Umum Arsitektur (High-Level Architecture)

Aplikasi dirancang menggunakan arsitektur **Single-Page Modular Web Application (SPA/Landing Architecture)** yang ringan, cepat dimuat di jaringan seluler, dan tidak memerlukan *backend server* eksternal untuk menjalankan fungsi simulasi, pemutar musik latar, maupun pengarah konversi WhatsApp.

```
+-------------------------------------------------------------------------+
|                        LAPISAN PRESENTASI (UI/UX)                       |
|  Tema: Luxury Grey (#1C1D21 / #282A30) + Gold Bold (#D4AF37) + #FFFFFF  |
+-------------------------------------------------------------------------+
        |                       |                        |
        v                       v                        v
+---------------+     +-------------------+    +--------------------------+
|  MODUL AUDIO  |     | MODUL INTERAKTIF  |    |   MODUL KONVERSI WA      |
| Web Audio API |     | • Kamus Search    |    | • Dynamic URL Builder    |
| • Play Button |     | • Generator Nota  |    | • Pre-filled Chat Text   |
| • Stop Button |     | • Simulator Arisan|    | • Quick Reg Form Builder |
| • Equalizer   |     | • Accordion FAQ   |    | • Admin Phone Config     |
+---------------+     +-------------------+    +--------------------------+
```

---

## 2. Struktur Hirarki DOM & Peta 11 Seksi

Seluruh halaman disusun dalam struktur semantik HTML5 dengan ID jangkar (*anchor IDs*) yang konsisten:

```
body (bg-[#1C1D21] text-white)
 ├── Top Utility Bar (Device Preview Switcher: Desktop / Tablet / HP + Input No. WA Admin)
 └── #appViewport (Container Responsif Utama)
      ├── header (Sticky Navigation + UI/UX Music Play & Stop + Mobile Drawer + Alur Psikologi)
      ├── section#seksi-1  → 01. Beranda (Hero + Trust Badges + Kompas Navigasi Cepat + 4 Pilar)
      ├── section#seksi-2  → 02. Tentang Arisan (Profil Perusahaan + 4 Kartu Visi & Misi)
      ├── section#seksi-3  → 03. Kamus Arisan (Live Search + Filter Kategori + 10 Kartu Istilah)
      ├── section#seksi-4  → 04. Pembayaran (4 Kartu Rekening Copyable + Tabel + Generator Berita Transfer)
      ├── section#seksi-5  → 05. Jenis-Jenis Arisan (Kartu Menurun, Tender, Flat + Simulator + Tabel Perbandingan)
      ├── section#seksi-6  → 06. Syarat & Ketentuan Arisan (4 Kartu Hukum & Operasional Arisan)
      ├── section#seksi-7  → 07. Syarat & Ketentuan Dapin (4 Kartu Aturan Dana Pinjaman + CTA WA)
      ├── section#seksi-8  → 08. Syarat & Ketentuan Cicil/Kredit (3 Kartu Aturan Kredit & UM + CTA WA)
      ├── section#seksi-9  → 09. Rules (5 Kartu Peraturan Disiplin Komunitas RULE 01 – RULE 05)
      ├── section#seksi-10 → 10. Cara Mengikuti Arisan (6 Langkah Visual + Formulir Pendaftaran Cepat WA)
      ├── section#seksi-11 → 11. FAQ (6 Accordion Interaktif + Banner Konversi Akhir)
      ├── footer (Ringkasan Brand + Kontrol Musik Play/Stop Sekunder)
      ├── Floating Action Button (Chat WA Admin di Kanan Bawah)
      └── #toastBox (Komponen Notifikasi Non-Intrusif)
```

---

## 3. Arsitektur Modul Fungsional & State Management

### 3.1. Modul Musik Background (`AudioController`)
* **State:**
  * `audioCtx`: Instance dari `AudioContext` atau `webkitAudioContext`.
  * `isMusicPlaying`: Boolean (`true` saat musik berjalan, `false` saat berhenti).
  * `musicLoopTimer`: ID interval untuk penjadwalan akor *ambient*.
  * `chordStepIndex`: Pointer indeks akor aktif.
* **Alur Kerja Tombol Play (`startBackgroundMusic()`):**
  1. Memeriksa ketersediaan `AudioContext`. Jika belum ada, buat instance baru.
  2. Jika `audioCtx.state === 'suspended'`, jalankan `audioCtx.resume()` (wajib untuk membuka kunci audio pada iOS Safari dan Android Chrome).
  3. Mengubah `isMusicPlaying = true`, mengaktifkan kelas CSS `.playing` pada `#eqVisualizer` (menggerakkan 4 bar equalizer emas), dan memperbarui teks status.
  4. Memainkan akor pertama dan menjadwalkan interval `setInterval(playAmbientChordStep, 3200)`.
* **Alur Kerja Tombol Stop (`stopBackgroundMusic()`):**
  1. Mengubah `isMusicPlaying = false` dan membersihkan `musicLoopTimer`.
  2. Memanggil `audioCtx.suspend()` agar suara berhenti seketika, serta mereset `chordStepIndex = 0`.
  3. Menonaktifkan animasi equalizer dan memperbarui label status menjadi `"🎵 Musik Latar: Berhenti"`.

### 3.2. Modul Integrasi WhatsApp (`WhatsAppFunnelRouter`)
* **Fungsi Inti:** `openWhatsAppWithText(messageText)`
* **Mekanisme:**
  1. Mengambil nomor WhatsApp Admin dari `#inputWaNumber` dan membersihkan karakter non-angka (`replace(/[^0-9]/g, "")`).
  2. Membentuk URL `https://wa.me/${phone}?text=${encodeURIComponent(messageText)}`.
  3. Membuka tautan di tab baru sehingga sesi pengguna di halaman web profil tidak tertutup.

### 3.3. Modul Pencarian & Filter Kamus Arisan (Seksi 3)
* **Sumber Data:** Array konstan `KAMUS_DATA` (10 objek istilah: `term`, `full`, `cat`, `desc`).
* **Pemicu Reaktif:** Event `input` pada `#inputSearchKamus` dan `change` pada `#selectFilterKamus`.
* **Output:** Merender ulang grid kartu `#kamusGrid` secara instan. Jika tidak ada hasil yang cocok, menampilkan pesan panduan ramah.

### 3.4. Modul Generator Berita Transfer & Salin Rekening (Seksi 4)
* **Fitur Salin Rekening:** Menggunakan `navigator.clipboard.writeText()` dengan *fallback* otomatis ke `<textarea>` + `document.execCommand('copy')` agar berfungsi di seluruh *webview* Android/iOS, lalu memunculkan `#toastBox`.
* **Generator Berita Transfer:** Menggabungkan input `Kategori (ARISAN / DAPIN / KREDIT)`, `Nama Kloter/Kode/Barang`, `Nomor Slot/Angsuran`, dan `Nama Member` ke dalam format standar `KATEGORI - REFERENSI - SLOT - NAMA`, siap disalin atau dikirim langsung ke WhatsApp Admin.

### 3.5. Modul Simulator Arisan Menurun, Tender & Flat (Seksi 5)
* **Input State:**
  * `currentSimMode`: `'MENURUN' | 'TENDER' | 'FLAT'`
  * `getVal`: Target pencairan (`Rp 10.000.000`, `Rp 20.000.000`, atau `Rp 50.000.000`)
  * `slotNum`: Nomor urut slot (`1` s/d `10`)
* **Output:** Menghitung secara *real-time* estimasi setoran per putaran, total akumulasi setoran 10 putaran, total dana diterima (*Get*), serta keterangan keuntungan psikologis (cair cepat di awal vs hemat tabungan di akhir).

---

## 4. Arsitektur Responsif Lintas Perangkat (Cross-Platform Matrix)

| Kategori Perangkat | Breakpoint CSS | Perilaku Layout & Navigasi | Optimasi Khusus OS / Browser |
| :--- | :--- | :--- | :--- |
| **HP Android & iPhone (iOS)** | `< 640px` (Default Mobile-First) | Grid 1 kolom (`grid-cols-1`); navigasi menggunakan tombol `☰` (*Mobile Drawer*); tabel dibungkus `overflow-x-auto`. | Dukungan `-webkit-backdrop-filter`, ukuran tombol sentuh minimal `44px`, font input minimal `12px–14px` dengan `outline-none`. |
| **Tablet & iPad** | `sm:` (`>= 640px`) & `md:` (`>= 768px`) | Grid 2 kolom (`sm:grid-cols-2` / `md:grid-cols-2`); kartu informasi tersusun seimbang kanan-kiri. | Dukungan orientasi *portrait* maupun *landscape* tanpa tumpang tindih elemen. |
| **Laptop & Desktop Monitor** | `lg:` (`>= 1024px`) & `xl:` (`>= 1280px`) | Grid 3–5 kolom (`lg:grid-cols-3`, `lg:grid-cols-4`, `lg:grid-cols-5`); navigasi penuh tampil di Header (`xl:flex`). | Lebar kontainer dikunci pada `max-w-7xl mx-auto` agar baris teks tetap nyaman dibaca di monitor lebar. |
