# Anti_AI_Slop_UI_UX.md — Standar Desain Profesional, Ikonografi SVG, Anatomi Tombol & UX Anti-AI-Slop

Dokumen ini adalah **Panduan Kualitas Visual & Pengalaman Pengguna (UI/UX Quality Gate)** yang wajib dipatuhi oleh AI Agent di Antigravity bersama dengan `Prd.md`, `Claude.md`, `Architecture.md`, `Todo.md`, dan `Skill.md`. Tujuan dokumen ini adalah memastikan **Web Company Profile Arisan, Dapin & Kredit** tampil seperti situs **Private Banking & Wealth Management kelas atas**—bukan tampilan generik khas buatan AI (*AI Slop*).

---

## 1. Daftar Larangan Keras "AI Slop" (Strict Anti-AI-Slop Blacklist)

AI Agent **DILARANG KERAS** melakukan 7 kebiasaan buruk desain AI berikut:

| Ciri Khas "AI Slop" (DILARANG) | Standar Profesional Pengganti (WAJIB DIGUNAKAN) |
| :--- | :--- |
| **1. Memakai Emoji sebagai Ikon UI** (`💬`, `🧭`, `📋`, `🎵`, `★`, `▶`, `■`, `☰`, `🚀`, `✨`) | **Wajib 100% Inline SVG Vector Icons** dengan ketebalan garis konsisten (`stroke-width="1.75"` atau `2`), warna `#D4AF37` (Gold) atau `#FFFFFF` (Putih). |
| **2. Efek "Box-in-Box-in-Box" Berlebihan** (Kotak berbingkai di dalam kotak berbingkai secara berlapis-lapis) | Gunakan satu kartu utama (`.luxury-card`) dengan pemisah garis tipis (*hairline divider* `border-b border-[#3A3D45]/70`) di bagian dalamnya agar ruang bernapas (*whitespace*) lega. |
| **3. Gradasi Emas Kuning Menyilaukan & Bayangan Neon** (`box-shadow` kuning terang yang kabur) | Gunakan **Brushed Champagne Gold** (`#D4AF37` & `#E6C65A`) dengan bayangan gelap natural (`0 12px 32px -8px rgba(0, 0, 0, 0.6)`) dan garis tepi emas tipis (`1px solid rgba(212, 175, 55, 0.25)`). |
| **4. Warna Tombol WhatsApp Hijau Neon Mentah** (`#25D366` polos tanpa kedalaman) | Gunakan **Refined Emerald Green** (`linear-gradient(135deg, #1F9D55 0%, #157A40 100%)`) dengan bingkai dalam tipis (`inset 0 1px 0 rgba(255,255,255,0.2)`) dan ikon SVG WhatsApp resmi. |
| **5. Tombol Play/Stop Musik Berupa Teks Kasar** (`▶ Play` / `■ Stop` karakter ASCII) | Gunakan **Precision SVG Audio Controls** (ikon poligon Play SVG, ikon persegi Stop SVG, dan 4 bar equalizer vertikal presisi) di dalam kapsul kontrol berlapis kaca (*glassmorphic pill*). |
| **6. Angka Rupiah & Nomor Rekening Tidak Sejajar** | Wajib menerapkan `font-variant-numeric: tabular-nums` pada seluruh nominal Rupiah, nomor urut slot, dan nomor rekening bank agar sejajar rapi seperti laporan perbankan. |
| **7. Teks Rapat Tanpa Hierarki Scannable** | Terapkan struktur 3 lapis di setiap seksi: **Eyebrow Label** (Gold Bold `11px` uppercase) → **Judul Utama H2** (`Playfair Display` Gold Bold) → **Paragraf Pengantar** (`Plus Jakarta Sans` Putih `#FFFFFF`, lebar maksimal `65ch`). |

---

## 2. Pustaka Ikon SVG Presisi Tinggi (Zero-Emoji SVG Icon System)

Gunakan potongan kode **Inline SVG** di bawah ini untuk seluruh elemen ikon di halaman web. Jangan pernah menggantinya dengan emoji atau ikon berbasis *font* eksternal yang rawan gagal dimuat.

### 2.1. Ikon SVG WhatsApp Resmi (Untuk Semua Tombol CTA WhatsApp)
```html
<svg class="w-4 h-4 shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M3 21l1.65-3.8a9 9 0 1 1 3.4 2.9L3 21" />
  <path d="M9 10a.5.5 0 0 0 1 0V9a.5.5 0 0 0-1 0v1a5 5 0 0 0 5 5h1a.5.5 0 0 0 0-1h-1a.5.5 0 0 0 0 1" />
</svg>
```

### 2.2. Ikon SVG Play & Stop Musik Background (Untuk UI/UX Audio Controller)
```html
<!-- SVG Tombol Play -->
<svg class="w-3.5 h-3.5 shrink-0 fill-current" viewBox="0 0 24 24" aria-hidden="true">
  <polygon points="6 4 20 12 6 20 6 4" />
</svg>

<!-- SVG Tombol Stop -->
<svg class="w-3.5 h-3.5 shrink-0 fill-current" viewBox="0 0 24 24" aria-hidden="true">
  <rect x="6" y="6" width="12" height="12" rx="1.5" />
</svg>
```

### 2.3. Ikon SVG Salin Rekening (`Copy`) & Verifikasi (`Shield Check`)
```html
<!-- SVG Salin / Copy -->
<svg class="w-4 h-4 shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <rect x="9" y="9" width="13" height="13" rx="2" ry="2" />
  <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1" />
</svg>

<!-- SVG Shield Check (Keamanan KYC & Garansi Pencairan) -->
<svg class="w-4 h-4 shrink-0 text-[#D4AF37]" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
  <path d="m9 12 2 2 4-4" />
</svg>
```

### 2.4. Ikon SVG Navigasi, Pencarian Kamus, Panah Alur & Accordion FAQ
```html
<!-- SVG Panah Kanan (Pengarah Alur Antar-Seksi) -->
<svg class="w-4 h-4 shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M5 12h14" />
  <path d="m12 5 7 7-7 7" />
</svg>

<!-- SVG Pencarian (Input Search Kamus Arisan) -->
<svg class="w-4 h-4 shrink-0 text-[#D4AF37]" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="11" cy="11" r="8" />
  <path d="m21 21-4.3-4.3" />
</svg>

<!-- SVG Chevron Accordion FAQ (Berputar 180 derajat saat dibuka) -->
<svg class="w-4 h-4 shrink-0 text-[#D4AF37] transition-transform duration-200" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="m6 9 6 6 6-6" />
</svg>

<!-- SVG Hamburger Menu Mobile -->
<svg class="w-5 h-5 shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <line x1="4" y1="6" x2="20" y2="6" />
  <line x1="4" y1="12" x2="20" y2="12" />
  <line x1="4" y1="18" x2="20" y2="18" />
</svg>
```

---

## 3. Standar Desain Komponen Tombol (Button System Anti-AI-Slop)

Setiap tombol harus memiliki anatomi taktil (*tactile feel*), proporsi *padding* yang seimbang, tinggi minimal `44px` di layar sentuh, serta umpan balik mikro (*micro-interaction*) saat disentuh atau diarahkan kursor:

### 3.1. CSS Sistem Tombol Profesional
```css
/* 1. Tombol Utama Emas Mewah (Primary Gold CTA) */
.gold-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.625rem;
  background: linear-gradient(135deg, #E6C65A 0%, #D4AF37 55%, #B88E1E 100%);
  color: #141518;
  font-weight: 700;
  letter-spacing: 0.01em;
  border: 1px solid rgba(255, 255, 255, 0.28);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.35), 0 6px 18px -4px rgba(212, 175, 55, 0.35);
  transition: transform 0.2s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.2s ease, filter 0.2s ease;
}
.gold-btn:hover {
  filter: brightness(1.06);
  transform: translateY(-1.5px);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.45), 0 10px 24px -4px rgba(212, 175, 55, 0.45);
}
.gold-btn:active {
  transform: translateY(0);
}

/* 2. Tombol Konversi WhatsApp Eksklusif (Refined Emerald CTA) */
.wa-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.625rem;
  background: linear-gradient(135deg, #1F9D55 0%, #157A40 100%);
  color: #FFFFFF;
  font-weight: 700;
  letter-spacing: 0.01em;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.22), 0 6px 18px -4px rgba(21, 122, 64, 0.45);
  transition: transform 0.2s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.2s ease, filter 0.2s ease;
}
.wa-btn:hover {
  filter: brightness(1.08);
  transform: translateY(-1.5px);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3), 0 10px 24px -4px rgba(31, 157, 85, 0.55);
}
.wa-btn:active {
  transform: translateY(0);
}

/* 3. Tombol Sekunder / Outline Abu Mewah & Emas */
.outline-gold-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  background-color: #282A30;
  color: #FFFFFF;
  font-weight: 600;
  border: 1px solid rgba(212, 175, 55, 0.42);
  transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
}
.outline-gold-btn:hover {
  background-color: rgba(212, 175, 55, 0.14);
  border-color: #D4AF37;
  color: #D4AF37;
}
```

### 3.2. Aturan Penempatan & Label Tombol (Button UX Rules)
* **Gunakan Kata Kerja Aktif & Spesifik:** Jangan menulis label tombol generik seperti `"Klik di Sini"` atau `"Submit"`. Gunakan label yang menjelaskan hasil tindakan secara jelas:
  * `"Daftar & Cek Opslot via WhatsApp"`
  * `"Salin No. Rekening BCA"`
  * `"Kirim Konfirmasi ke WA"`
  * `"Cek Opslot Arisan Menurun"`
* **Satu Tombol Primer per Blok Pandangan:** Di setiap kartu atau blok seksi, pastikan hanya ada **1 tombol menonjol utama** (Gold atau Emerald WA) agar mata pengguna langsung tahu ke mana harus menekan tanpa bingung.

---

## 4. Arsitektur Keterbacaan & Kemudahan Pemahaman (User-Friendly UX)

Agar pengunjung baru (baik yang sudah biasa ikut arisan maupun yang baru pertama kali) langsung paham alur tanpa pusing:

### 4.1. Pola "3-Second Visual Scan" di Setiap Seksi
Setiap seksi (Seksi 1 s/d Seksi 11) wajib memiliki anatomi pembuka yang konsisten:
1. **Nomor & Label Seksi (Eyebrow):** `05 • JENIS-JENIS ARISAN & SIMULASI` (Warna `#D4AF37`, huruf kapital, ukuran `12px`, `letter-spacing: 0.1em`, Bold).
2. **Judul Utama Seksi (`H2`):** Kalimat tegas berwarna **Gold Bold (`#D4AF37`)** dengan ukuran proporsional (`24px` di HP, `30px–34px` di Desktop).
3. **Kalimat Intisari (1–2 Kalimat Putih `#FFFFFF`):** Menjelaskan manfaat seksi tersebut dalam bahasa sehari-hari yang sopan dan mudah dicerna.

### 4.2. Penyajian Data Finansial yang Jernih (Anti-Bingung)
* **Badge Status & Kategori:** Pada Kamus Arisan dan Jenis Arisan, berikan *pill badge* kecil di sudut kartu (contoh: `DANA & PEMBAYARAN`, `CAIR AWAL / HEMAT AKHIR`) agar otak pengguna langsung mengelompokkan informasi secara visual.
* **Angka Sejajar (`tabular-nums`):** Tambahkan aturan CSS `font-variant-numeric: tabular-nums;` pada seluruh elemen angka simulasi, nomor rekening, dan tabel perbandingan.
* **Umpan Balik Instan (*Micro-Feedback*):**
  * Saat pengguna menekan tombol **Salin No. Rekening**, teks tombol berubah sementara selama 1,5 detik atau memunculkan *Toast* elegan di sudut layar (`"Berhasil disalin: Nomor Rekening BCA"`).
  * Saat pengguna menggeser *slider* nomor urut slot pada **Simulator Arisan Menurun**, nominal setoran per bulan dan keterangan keuntungan berubah seketika tanpa perlu menekan tombol "Hitung".

---

## 5. Checklist Audit Anti-AI-Slop (Wajib Diverifikasi Sebelum Rilis)

- [x] **Zero Emoji Audit:** Tidak ada satu pun karakter emoji (`💬`, `🧭`, `📋`, `🎵`, `★`, `▶`, `■`, `☰`) di dalam kode HTML/JS; seluruhnya telah diganti dengan **Inline SVG Vector Icons** yang tajam.
- [x] **Strict Color Compliance:** Background 100% menggunakan Abu Mewah (`#1C1D21`, `#22242A`, `#282A30`), seluruh judul 100% menggunakan Gold Bold (`#D4AF37` / `#E6C65A`, `font-weight: 700–800`), dan seluruh teks lainnya 100% menggunakan Putih Bersih (`#FFFFFF`).
- [x] **Tactile Button Quality:** Tombol menggunakan *subtle inner highlight*, ikon SVG sejajar vertikal (`inline-flex items-center gap-2`), serta tinggi sentuh minimal `44px` di Android dan iOS.
- [x] **Tabular Financial Numbers:** Seluruh nomor rekening bank dan nominal Rupiah pada simulator menggunakan `tabular-nums`.
- [x] **Clean Card Hierarchy:** Kartu memiliki jarak antar-elemen (*padding* `20px–24px`) yang lega, bebas *box-in-box* yang semrawut, dan responsif di Android, iOS, Tablet, Laptop, maupun Desktop.
