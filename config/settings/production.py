"""
Production settings.

Untuk deployment ke Vercel / Supabase.
Aktifkan dengan: DJANGO_SETTINGS_MODULE=config.settings.production
"""

import os
from pathlib import Path

import dj_database_url
from dotenv import load_dotenv

from .base import *  # noqa: F401,F403

# ---------------------------------------------------------------------------
# Load .env file
# ---------------------------------------------------------------------------
ENV_FILE = Path(__file__).resolve().parent.parent.parent / '.env'
load_dotenv(ENV_FILE)

DEBUG = os.environ.get('DEBUG', 'False').lower() == 'true'

ALLOWED_HOSTS = ['.vercel.app', '127.0.0.1', 'localhost']

# ---------------------------------------------------------------------------
# Database – Supabase (PostgreSQL)
# URL diambil dari file .env (key: DATABASE_URL)
# ---------------------------------------------------------------------------
DATABASES = {
    'default': dj_database_url.parse(os.environ.get('DATABASE_URL'))
}
