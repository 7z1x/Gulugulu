# 🍜 Gulugulu — Search Engine Makanan Indonesia

<p align="center">
  <img src="webapp/static/webapp/images/img.png" alt="Gulugulu Logo" width="200"/>
</p>

<p align="center">
  <strong>Search Engine berbasis TF-IDF & Cosine Similarity untuk pencarian makanan khas Indonesia.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.11-blue?logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Django-5.1-green?logo=django&logoColor=white" alt="Django"/>
  <img src="https://img.shields.io/badge/Database-Supabase-3ECF8E?logo=supabase&logoColor=white" alt="Supabase"/>
  <img src="https://img.shields.io/badge/Deploy-Vercel-black?logo=vercel&logoColor=white" alt="Vercel"/>
</p>

---

## 📖 Tentang Project

**Gulugulu** adalah aplikasi web *search engine* yang dirancang khusus untuk mencari informasi tentang makanan khas Indonesia. Aplikasi ini dibangun sebagai tugas mata kuliah **Sistem Temu Kembali Informasi (STKI)**.

Sistem ini mengimplementasikan teknik **Information Retrieval** dengan pendekatan:
- **TF-IDF (Term Frequency – Inverse Document Frequency)** untuk pembobotan kata
- **Cosine Similarity** untuk mengukur kemiripan antara query pencarian dengan data makanan
- **Fuzzy Matching** untuk memberikan saran "Mungkin maksud Anda..." ketika hasil pencarian tidak ditemukan
- **Stemming Bahasa Indonesia** menggunakan library Sastrawi untuk normalisasi kata

## ✨ Fitur

| Fitur | Deskripsi |
|-------|-----------|
| 🔍 **Pencarian Cerdas** | Cari makanan berdasarkan nama, bahan, atau deskripsi menggunakan algoritma TF-IDF |
| 📊 **Bobot Relevansi** | Setiap hasil pencarian dilengkapi skor bobot (weight) yang menunjukkan tingkat relevansi |
| 💡 **Saran Pencarian** | Ketika tidak ada hasil, sistem memberikan saran kata terdekat menggunakan fuzzy matching |
| 📋 **Data Makanan** | Menampilkan seluruh 101 data makanan Indonesia dengan fitur pagination dan pencarian |
| 🌗 **Dark/Light Mode** | Toggle tema gelap dan terang untuk kenyamanan pengguna |
| 👥 **Halaman Tim** | Informasi anggota tim pengembang dengan animasi kartu 3D flip |

## 🛠️ Tech Stack

| Layer | Teknologi |
|-------|-----------|
| **Backend** | Python, Django 5.1 |
| **Frontend** | HTML, TailwindCSS, DaisyUI |
| **Database** | PostgreSQL (Supabase) |
| **NLP** | Sastrawi (Stemmer & Stopword), NLTK |
| **ML** | scikit-learn (TF-IDF, Cosine Similarity) |
| **Fuzzy** | FuzzyWuzzy, RapidFuzz |
| **Deploy** | Vercel |

## 📂 Struktur Project

```
Gulugulu/
├── config/                     # Konfigurasi Django
│   ├── settings/
│   │   ├── base.py             # Settings umum
│   │   ├── local.py            # Settings development (MySQL)
│   │   └── production.py       # Settings production (Supabase)
│   ├── urls.py                 # Root URL routing
│   ├── wsgi.py                 # Entry point WSGI
│   └── asgi.py                 # Entry point ASGI
│
├── webapp/                     # Aplikasi utama
│   ├── services/
│   │   └── search.py           # Logika TF-IDF & Cosine Similarity
│   ├── templates/webapp/       # Template HTML
│   ├── static/webapp/images/   # Asset gambar
│   ├── models.py               # Model database (Makanan)
│   ├── views.py                # Controller/Views
│   ├── urls.py                 # URL patterns webapp
│   └── admin.py                # Admin panel config
│
├── scripts/                    # Utility scripts
├── data/                       # Database backups
├── .env                        # Environment variables (tidak di-push)
├── manage.py
├── requirements.txt
└── vercel.json
```

## 🚀 Cara Menjalankan

### Prasyarat

- Python 3.11 atau 3.12
- Git

### 1. Clone Repository

```bash
git clone https://github.com/7z1x/Gulugulu.git
cd Gulugulu
```

### 2. Buat Virtual Environment

```bash
python -m venv venv

# Windows
venv\Scripts\activate

# Mac/Linux
source venv/bin/activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Konfigurasi Environment

Buat file `.env` di root project:

```env
DATABASE_URL=postgresql://your_supabase_url_here
DJANGO_SECRET_KEY=your_secret_key_here
DEBUG=True
```

### 5. Jalankan Migrasi

```bash
# Menggunakan Supabase
set DJANGO_SETTINGS_MODULE=config.settings.production
python manage.py migrate

# Atau menggunakan MySQL lokal (XAMPP)
set DJANGO_SETTINGS_MODULE=config.settings.local
python manage.py migrate
```

### 6. Jalankan Server

```bash
python manage.py runserver
```

Buka browser dan akses: **http://127.0.0.1:8000**

## 📸 Screenshot

| Halaman | Preview |
|---------|---------|
| **Home & Search** | Pencarian makanan dengan TF-IDF |
| **Data** | Tabel semua data makanan dengan pagination |
| **About Us** | Halaman profil tim dengan animasi 3D flip card |

## 🧮 Cara Kerja Algoritma

```
Input Query → Preprocessing → Stemming (Sastrawi) → TF-IDF Vectorization
                                                            ↓
                                                    Cosine Similarity
                                                            ↓
                                              Ranking berdasarkan bobot
                                                            ↓
                                                  Tampilkan Top 5 hasil
                                                            ↓
                                              (Jika kosong → Fuzzy Match)
```

1. **Preprocessing** — Membersihkan query dari spasi berlebih dan karakter berulang
2. **Stopword Removal** — Menghapus kata-kata umum Bahasa Indonesia (yang, di, dan, dll)
3. **Stemming** — Mengubah kata ke bentuk dasar menggunakan Sastrawi
4. **TF-IDF** — Menghitung bobot setiap kata dalam dokumen
5. **Cosine Similarity** — Mengukur kemiripan sudut antara vektor query dan vektor dokumen
6. **Fuzzy Matching** — Jika tidak ada hasil, mencari nama makanan terdekat menggunakan FuzzyWuzzy

## 👥 Tim Pengembang

| Nama | NIM |
|------|-----|
| Maulana Yusuf A. | 21106050011 |
| Indra Arya S. P. | 21106050002 |
| Muammar Mufid D. | 21106050007 |
| Zulfahmi M. Ardianto | 21106050009 |
| Levianita Rahmawati | 21106050037 |

## 📄 Lisensi

Project ini dibuat untuk keperluan akademik mata kuliah **Sistem Temu Kembali Informasi (STKI)**.

---

<p align="center">
  Made with ❤️ by Tim Gulugulu
</p>
