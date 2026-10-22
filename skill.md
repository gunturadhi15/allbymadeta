---
name: luxury-arisan-web-profile
description: Specialized domain and UI/UX engineering skill for building the Luxury Grey, Bold Gold, and Crisp White Arisan, Dapin, and Credit Web Company Profile with Web Audio API background music, WhatsApp conversion funnels, and interactive financial simulators.
---

# SKILL.md — Luxury Arisan, Dapin & Kredit Web Company Profile Skill

Gunakan panduan keahlian (*Skill*) ini saat membangun atau mengembangkan komponen visual, logika simulasi keuangan arisan, sistem pemutar musik latar, dan psikologi konversi WhatsApp pada proyek **Web Company Profile Arisan, Dapin & Kredit**.

---

## 1. Pola Implementasi Tema Visual (Luxury Grey + Bold Gold + Crisp White)

Selalu gunakan struktur CSS berikut agar tampilan memenuhi permintaan klien secara presisi (Latar Abu Mewah, Judul Gold Bold, dan Teks Lainnya Putih Bersih):

```css
:root {
  --bg-luxury-primary: #1C1D21;
  --bg-luxury-secondary: #22242A;
  --bg-luxury-card: #282A30;
  --border-luxury-grey: #3A3D45;
  --heading-gold-primary: #D4AF37;
  --heading-gold-light: #E6C65A;
  --text-white-primary: #FFFFFF;
}

body {
  background-color: var(--bg-luxury-primary);
  color: var(--text-white-primary);
  font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
  line-height: 1.65;
  overflow-x: hidden;
}

/* Wajib Bold Gold untuk seluruh Judul */
h1, h2, h3, h4, .gold-heading {
  color: var(--heading-gold-primary);
  font-family: 'Playfair Display', Georgia, serif;
  font-weight: 700;
  letter-spacing: 0.015em;
}

/* Kartu Abu Mewah dengan Bingkai Emas Halus */
.luxury-card {
  background: linear-gradient(180deg, #2A2C33 0%, #23252B 100%);
  border: 1px solid rgba(212, 175, 55, 0.28);
  box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.55);
  transition: transform 0.25s ease, border-color 0.25s ease, box-shadow 0.25s ease;
}

.luxury-card:hover {
  border-color: rgba(212, 175, 55, 0.65);
  box-shadow: 0 14px 36px -8px rgba(212, 175, 55, 0.14);
}
```

---

## 2. Pola Mesin Musik Background (UI/UX Tombol Play & Stop Lintas OS)

Agar musik latar dapat diputar di **Android, iOS (Safari/Chrome), maupun Laptop/Desktop** tanpa risiko gagal muat file eksternal, gunakan pola **Web Audio API Luxury Synthesizer** berikut (atau kombinasikan dengan elemen `<audio>` jika file MP3 lokal disediakan):

```javascript
let audioCtx = null;
let isMusicPlaying = false;
let musicLoopTimer = null;
let chordStepIndex = 0;

// Progresi Akor Ambient Mewah (Cmaj9 -> Am9 -> Fmaj9 -> G13)
const LUXURY_CHORDS = [
  [261.63, 329.63, 392.00, 493.88, 587.33],
  [220.00, 261.63, 329.63, 392.00, 493.88],
  [174.61, 220.00, 261.63, 329.63, 392.00],
  [196.00, 246.94, 293.66, 349.23, 440.00]
];

function playAmbientChordStep() {
  if (!isMusicPlaying || !audioCtx) return;
  const now = audioCtx.currentTime;
  const notes = LUXURY_CHORDS[chordStepIndex % LUXURY_CHORDS.length];
  chordStepIndex++;

  notes.forEach((freq, idx) => {
    const osc = audioCtx.createOscillator();
    const gain = audioCtx.createGain();
    osc.type = idx % 2 === 0 ? "sine" : "triangle";
    osc.frequency.setValueAtTime(freq, now + idx * 0.18);

    gain.gain.setValueAtTime(0.0001, now + idx * 0.18);
    gain.gain.exponentialRampToValueAtTime(0.028, now + idx * 0.18 + 0.35);
    gain.gain.exponentialRampToValueAtTime(0.0001, now + idx * 0.18 + 3.1);

    osc.connect(gain);
    gain.connect(audioCtx.destination);
    osc.start(now + idx * 0.18);
    osc.stop(now + idx * 0.18 + 3.2);
  });
}

function startBackgroundMusic() {
  const AudioContextClass = window.AudioContext || window.webkitAudioContext;
  if (!AudioContextClass) return;
  if (!audioCtx) audioCtx = new AudioContextClass();
  if (audioCtx.state === "suspended") audioCtx.resume();
  if (isMusicPlaying) return;

  isMusicPlaying = true;
  updateMusicUI();
  playAmbientChordStep();
  musicLoopTimer = setInterval(playAmbientChordStep, 3200);
}

function stopBackgroundMusic() {
  isMusicPlaying = false;
  if (musicLoopTimer) clearInterval(musicLoopTimer);
  if (audioCtx && audioCtx.state === "running") audioCtx.suspend();
  chordStepIndex = 0;
  updateMusicUI();
}
```

---

## 3. Rumus Simulasi 3 Jenis Arisan (Menurun, Tender, Flat)

Gunakan logika perhitungan ini pada **Kalkulator Simulasi Seksi 5** agar pengunjung langsung memahami perbedaan ketiga skema arisan secara konkret:

1. **Arisan Menurun (`MENURUN`):**
   * Setoran dasar = `Nominal_Get / 10` (untuk simulasi kloter 10 putaran).
   * Pengali slot (`multiplier`) menurun secara proporsional dari Slot #1 (pencairan awal, setoran lebih tinggi) hingga Slot #10 (pencairan akhir, setoran paling ringan):
     `multiplier = 1.18 - (slotNum - 1) * 0.033`
   * `Setoran_Per_Putaran = Math.round((Setoran_Dasar * multiplier) / 5000) * 5000`
   * Jika `Total_Get - (Setoran_Per_Putaran * 10) >= 0`, tampilkan keterangan **"Hemat / Profit Tabungan Rp ..."**; jika negatif (slot atas), tampilkan **"Cair Cepat di Putaran Ke-X"**.

2. **Arisan Tender (`TENDER`):**
   * Simulasikan penawaran lelang (*bid discount*) rata-rata sebesar `6%` dari `Nominal_Get`.
   * Pemenang tender menerima `Nominal_Get - Bid_Discount` secara cepat, sedangkan peserta lain mendapatkan pengurangan setoran sebesar `Bid_Discount / 10`.

3. **Arisan Flat (`FLAT`):**
   * Seluruh peserta dari Slot #1 hingga Slot #10 membayar nominal tetap: `Setoran_Per_Putaran = Nominal_Get / 10`.

---

## 4. Pola Integrasi WhatsApp Kontekstual (`wa.me`)

Pastikan setiap tombol WhatsApp membentuk pesan yang spesifik sesuai aksi pengguna:

```javascript
function openWhatsAppWithText(messageText) {
  const input = document.getElementById("inputWaNumber");
  const phone = (input ? input.value.replace(/[^0-9]/g, "") : "6281234567890") || "6281234567890";
  const url = "https://wa.me/" + phone + "?text=" + encodeURIComponent(messageText);
  window.open(url, "_blank", "noopener,noreferrer");
}
```

* **Format Konfirmasi Pembayaran (Seksi 4):**
  `ARISAN - [Nama Kloter] - [Nomor Slot] - [Nama Member]`
  `DAPIN - [Kode Pinjaman] - [Nama Member]`
  `KREDIT - [Nama Barang] - [Angsuran Ke-X] - [Nama Member]`
* **Format Formulir Pendaftaran Cepat (Seksi 10):**
  Mengirimkan Nama Lengkap, Kota Domisili, Layanan Pilihan (Arisan Menurun / Tender / Flat / Dapin / Kredit), serta Target Nominal Get langsung ke ruang obrolan WhatsApp Admin.

---

## 5. Prinsip Psikologi Konversi & Responsivitas Lintas Perangkat

1. **Prinsip Kejelasan Alur (*Guided User Flow*):**
   * Jangan biarkan pengguna menebak langkah berikutnya. Sediakan **Kompas Navigasi Cepat** di Seksi 1 dan tombol pengarah antar-seksi.
2. **Standar Layar Sentuh Android & iOS:**
   * Gunakan kelas responsif Tailwind (`grid-cols-1 sm:grid-cols-2 lg:grid-cols-4`) sehingga di layar HP kartu tersusun vertikal dengan rapi, dan di layar Laptop/Desktop tersusun dalam *grid* multi-kolom.
   * Pastikan setiap tabel memiliki pembungkus `overflow-x-auto` agar tidak pernah memicu *horizontal overflow* di layar HP kecil.
