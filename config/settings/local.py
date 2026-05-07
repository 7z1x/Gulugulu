"""
Local development settings.

Menggunakan MySQL via XAMPP (sesuai project asli).
"""

from .base import *  # noqa: F401,F403

import pymysql
pymysql.version_info = (1, 4, 3, "final", 0)
pymysql.install_as_MySQLdb()

DEBUG = True

ALLOWED_HOSTS = ['127.0.0.1', 'localhost']

# ---------------------------------------------------------------------------
# Database – MySQL lokal (XAMPP)
# ---------------------------------------------------------------------------
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'db_stki_knn',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3308',
    }
}

# ---------------------------------------------------------------------------
# Debug tools (hanya untuk development)
# ---------------------------------------------------------------------------
INSTALLED_APPS += [  # noqa: F405
    'debug_toolbar',
    'django_dump_die',
]

MIDDLEWARE += [  # noqa: F405
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django_dump_die.middleware.DumpAndDieMiddleware',
]

INTERNAL_IPS = [
    '127.0.0.1',
]
