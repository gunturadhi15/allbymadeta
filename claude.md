# CLAUDE.md — Agent Context, Rules & Coding Standards (Antigravity / AI Agent Guide)

Dokumen ini adalah panduan operasional utama bagi AI Agent (Antigravity / Claude Code) saat membangun, memodifikasi, dan memverifikasi proyek **Web Company Profile Layanan Arisan, Dapin & Kredit Eksklusif**. Bacalah dokumen ini terlebih dahulu sebelum mengeksekusi tugas di `Todo.md`.

---

## 1. Peta Dokumen Proyek (Workspace Context)
Seluruh spesifikasi proyek dibagi menjadi 5 dokumen Markdown yang saling terhubung:
1. **`Prd.md`**: Dokumen kebutuhan produk, spesifikasi warna klien, fitur utama, dan seluruh naskah *copywriting* final untuk Seksi 1 hingga Seksi 11.
2. **`Claude.md` (File Ini)**: Instruksi sistem, aturan penulisan kode (*coding standards*), larangan teknis (*hard guardrails*), dan standar verifikasi.
3. **`Architecture.md`**: Desain arsitektur teknis, manajemen *state*, struktur DOM, skema audio Web Audio API, dan arsitektur *responsive breakpoints*.
4. **`Todo.md`**: Daftar tugas eksekusi berurutan (*step-by-step task list*) yang wajib dikerjakan dan dicentang satu per satu.
5. **`Skill.md`**: Modul keahlian khusus (*domain skill*) yang berisi rumus perhitungan simulasi Arisan (Menurun, Tender, Flat), kode *synthesizer* musik latar mewah, serta pola psikologi UI/UX.

---

## 2. Aturan Ketat Desain & Tema Klien (Non-Negotiable Theme Rules)

1. **Warna Abu Mewah (Luxury Grey Background & Surfaces):**
   * Gunakan `#1C1D21` untuk latar belakang halaman utama (`body`).
   * Gunakan `#22242A` untuk latar belakang seksi alternatif (selang-seling agar pemisahan visual antar seksi jelas).
   * Gunakan `#282A30` (atau gradasi `#2A2C33` ke `#23252B`) untuk latar kartu (*cards*), tabel, input, dan *accordion*.
   * **DILARANG** menggunakan latar belakang putih terang atau warna pastel yang merusak nuansa *Luxury Dark Grey*.

2. **Tulisan Gold Bold untuk Judul:**
   * Seluruh elemen judul (`h1`, `h2`, `h3`, `h4`, judul kartu, nomor urut langkah, dan label istilah kamus) **WAJIB** menggunakan warna emas `#D4AF37` (dengan sorotan `#E6C65A`) dan ketebalan **Bold (`font-weight: 700` atau `800`)**.
   * Gunakan *font family* `'Playfair Display', Georgia, serif` untuk seluruh judul utama agar menampilkan kesan mewah dan berwibawa.

3. **Putih Bersih untuk Teks Lainnya:**
   * Seluruh paragraf, poin syarat & ketentuan, isi tabel, dan jawaban FAQ **WAJIB** menggunakan warna putih bersih (`#FFFFFF`) dengan *font family* `'Plus Jakarta Sans', sans-serif`.
   * Jangan pernah menggunakan teks abu-abu gelap di atas latar abu-abu gelap yang menurunkan keterbacaan (pastikan rasio kontras memenuhi standar WCAG AAA).

---

## 3. Aturan Teknis & Anti-Bug (Hard Engineering Guardrails)

### A. Aturan Kelengkapan Konten (Zero Truncation / Zero Placeholder)
* **DILARANG** menulis komentar seperti `// TODO: tambahkan sisa seksi`, `<!-- isi konten lainnya di sini -->`, atau menyingkat daftar 11 seksi.
* Seluruh 11 seksi (Beranda, Tentang Arisan, Kamus Arisan, Pembayaran, Jenis-Jenis Arisan, S&K Arisan, S&K Dapin, S&K Cicil/Kredit, Rules, Cara Mengikuti Arisan, FAQ) harus ditulis secara utuh sesuai `Prd.md`.

### B. Aturan Audio Background Music (UI/UX Play & Stop)
* Wajib menyertakan tombol **Play (`▶ Play`)** dan **Stop (`■ Stop`)** yang terlihat jelas pada UI/UX (di Header sticky dan Footer).
* **Penanganan Autoplay iOS Safari & Android Chrome:** Browser modern memblokir pemutaran suara sebelum ada interaksi sentuhan/klik pengguna. Oleh karena itu:
  * Inisialisasi atau panggil `audioCtx.resume()` tepat di dalam *event listener* klik tombol `Play`.
  * Gunakan sintesis **Web Audio API** (sesuai pola di `Skill.md`) agar musik latar selalu dapat berbunyi 100% tanpa bergantung pada file `.mp3` eksternal yang rawan gagal dimuat (*CORS / 404 error*).

### C. Aturan Integrasi WhatsApp (`wa.me`)
* Semua tombol CTA WhatsApp wajib memanggil fungsi terpusat `openWhatsAppWithText(messageText)`.
* Pesan teks harus dienkode menggunakan `encodeURIComponent(messageText)` dan dibuka dengan `window.open(url, "_blank", "noopener,noreferrer")`.
* Jangan pernah membiarkan tombol CTA menggunakan `href="#"` mati tanpa aksi.

### D. Aturan Kompatibilitas Android, iOS, HP, Tablet, Laptop & Desktop
* Wajib menyertakan `<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />`.
* Bungkus semua elemen `<table>` dengan `<div class="overflow-x-auto">` agar tabel perbandingan dan tabel pembayaran dapat digeser secara mulus di layar HP Android/iOS tanpa merusak tata letak halaman.
* **DILARANG** menggunakan `window.alert()`, `window.confirm()`, atau `window.prompt()`. Gunakan komponen notifikasi **Toast** kustom di dalam halaman untuk memberikan umpan balik visual (misalnya saat menyalin nomor rekening atau memutar musik).

---

## 4. Alur Kerja Eksekusi untuk Agent (Execution Protocol)
Saat Anda diminta membangun atau memperbarui proyek ini di Antigravity:
1. Baca `Prd.md` untuk memastikan ke-11 seksi dan teks *copywriting* lengkap.
2. Baca `Architecture.md` dan `Skill.md` untuk memahami struktur komponen, rumus kalkulator arisan, dan mesin audio.
3. Kerjakan `Todo.md` secara berurutan dari Fase 1 hingga Fase 7.
4. Setelah kode selesai ditulis, lakukan pengecekan mandiri terhadap seluruh ID elemen DOM dan *event listener* untuk memastikan setiap tombol berfungsi 100%.
