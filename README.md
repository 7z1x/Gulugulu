<p align="center">
  <img src="webapp/static/webapp/images/gulu-removebg-preview.png" alt="Gulugulu" width="140">
</p>

<h1 align="center">Gulugulu</h1>

<p align="center">
  Indonesian food search engine powered by TF-IDF &amp; Cosine Similarity.<br>
  <strong><a href="#usage">Explore Gulugulu usage Â»</a></strong>
  <br><br>
  <a href="https://github.com/7z1x/Gulugulu/issues/new?labels=bug&template=bug_report.md">Report bug</a>
  Â·
  <a href="https://github.com/7z1x/Gulugulu/issues/new?labels=enhancement&template=feature_request.md">Request feature</a>
  Â·
  <a href="https://github.com/7z1x/Gulugulu">Repository</a>
</p>

<p align="center">
  <a href="https://www.python.org/downloads/"><img src="https://img.shields.io/badge/Python-3.11-blue?logo=python&logoColor=white" alt="Python"></a>
  <a href="https://www.djangoproject.com/"><img src="https://img.shields.io/badge/Django-5.1-green?logo=django&logoColor=white" alt="Django"></a>
  <a href="https://supabase.com/"><img src="https://img.shields.io/badge/Database-Supabase-3ECF8E?logo=supabase&logoColor=white" alt="Supabase"></a>
  <a href="https://vercel.com/"><img src="https://img.shields.io/badge/Deploy-Vercel-black?logo=vercel&logoColor=white" alt="Vercel"></a>
</p>

---

## Overview

**Gulugulu** is a web-based search engine built to retrieve information about traditional
Indonesian food. It implements classical **Information Retrieval** techniques â€” **TF-IDF**
weighting combined with **Cosine Similarity** â€” on a curated dataset of 101 dishes, and
enhances the experience with Indonesian stemming (Sastrawi), fuzzy matching fallback, and
a dark/light theme.

The project was originally built for the *Sistem Temu Kembali Informasi (STKI)* course.

### How it works

1. **Query input** â€” the user types a food name, ingredient, or description.
2. **Preprocessing** â€” excess whitespace is trimmed; Indonesian stop words are removed.
3. **Stemming** â€” words are reduced to their root form using **Sastrawi**.
4. **TF-IDF vectorization** â€” each term is weighted across the 101-document corpus.
5. **Cosine Similarity** â€” the angle between the query vector and every document vector is measured.
6. **Ranking** â€” results are sorted by relevance weight; the top 5 are returned.
7. **Fuzzy fallback** â€” when no match is found, **FuzzyWuzzy/RapidFuzz** suggests the closest
   food names ("Did you mean...?").

---

## Files

- **[README.md](README.md)** â€” the file you are currently reading.
- **[requirements.txt](requirements.txt)** â€” Python dependencies.
- **[manage.py](manage.py)** â€” Django management entry point.
- **[vercel.json](vercel.json)** â€” deployment config for Vercel.
- **[config/](config/)** â€” Django project settings
  - `settings/base.py` â€” shared settings.
  - `settings/local.py` â€” development (MySQL/XAMPP).
  - `settings/production.py` â€” production (Supabase PostgreSQL).
  - `urls.py`, `wsgi.py`, `asgi.py` â€” routing & entry points.
- **[webapp/](webapp/)** â€” the main application
  - `services/search.py` â€” TF-IDF & Cosine Similarity engine.
  - `models.py` â€” `Makanan` database model.
  - `views.py` â€” controllers for search, data list, and team pages.
  - `urls.py` â€” URL patterns.
  - `templates/webapp/` â€” Jinja/HTML templates.
  - `static/webapp/images/` â€” logo & image assets.
- **[scripts/](scripts/)** â€” utility scripts (DB seeding, Supabase SQL).
- **[data/](data/)** â€” database backups and SQL dumps.
- **[STKI_SearchEngine/](STKI_SearchEngine/)** â€” legacy settings package.

---

## Requirements

- **Python 3.11** or **3.12**
- **Git**

### Python dependencies

| Package | Purpose |
|---|---|
| [Django](https://www.djangoproject.com/) | Web framework |
| [scikit-learn](https://scikit-learn.org/) | TF-IDF vectorizer & Cosine Similarity |
| [Sastrawi](https://github.com/sastrawi/sastrawi) | Indonesian stemmer & stopword removal |
| [NLTK](https://www.nltk.org/) | NLP utilities |
| [FuzzyWuzzy](https://github.com/seatgeek/fuzzywuzzy) / [RapidFuzz](https://github.com/maxbachmann/RapidFuzz) | Fuzzy string matching fallback |
| [psycopg2-binary](https://pypi.org/project/psycopg2-binary/) | PostgreSQL driver (Supabase) |
| [PyMySQL](https://pymysql.readthedocs.io/) | MySQL driver (local dev) |
| [python-dotenv](https://github.com/theskumar/python-dotenv) | Load env config from `.env` |

---

## Installing

```bash
git clone https://github.com/7z1x/Gulugulu.git
cd Gulugulu
python -m venv venv

# Activate the virtual environment
# Windows (PowerShell):
.venv\Scripts\Activate.ps1
# macOS / Linux:
source venv/bin/activate

pip install -r requirements.txt
```

Create a `.env` file in the project root:

```env
DATABASE_URL=postgresql://your_supabase_url_here
DJANGO_SECRET_KEY=your_secret_key_here
DEBUG=True
```

Apply migrations and run the server:

```bash
# Using Supabase (production settings)
set DJANGO_SETTINGS_MODULE=config.settings.production
python manage.py migrate

# Or using local MySQL (XAMPP)
set DJANGO_SETTINGS_MODULE=config.settings.local
python manage.py migrate

python manage.py runserver
```

---

## Usage

Open your browser at:

```
http://127.0.0.1:8000
```

From the search page you can:

1. Type a **food name**, ingredient, or keyword (e.g. *rendang*, *sambal*, *coconut milk*).
2. View **ranked results** with relevance weight scores.
3. Browse the **Data** page â€” paginated list of all 101 Indonesian dishes.
4. If nothing matches, review the **"Did you mean...?"** fuzzy suggestions.
5. Toggle **dark / light mode** for comfortable reading.
6. Visit the **About Us** page to meet the team (3D flip cards).

---

## Algorithm Flow

```
Input Query â†’ Preprocessing â†’ Stemming (Sastrawi) â†’ TF-IDF Vectorization
                                                            â†“
                                                    Cosine Similarity
                                                            â†“
                                              Ranking by weight
                                                            â†“
                                                  Top 5 results
                                                            â†“
                                              (if empty â†’ Fuzzy Match)
```

---

## Acknowledgements

Built as a team project for the **Sistem Temu Kembali Informasi (STKI)** course using
[Django](https://www.djangoproject.com/), [scikit-learn](https://scikit-learn.org/),
and [Sastrawi](https://github.com/sastrawi/sastrawi).

---

<p align="center">
  Made with â¤ï¸ by Tim Gulugulu
</p>
