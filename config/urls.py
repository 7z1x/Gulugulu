"""
URL configuration for Gulugulu project.
"""
from django.conf import settings
from django.contrib import admin
from django.urls import path, include
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('webapp.urls')),
]

# Debug toolbar URLs (hanya muncul saat DEBUG=True)
if settings.DEBUG:
    urlpatterns += [
        path('__debug__/', include('debug_toolbar.urls')),
    ]
    # Ini baris penting agar Vercel WSGI mau serve file static!
    urlpatterns += staticfiles_urlpatterns()
