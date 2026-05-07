from django.contrib import admin
from .models import Makanan


@admin.register(Makanan)
class MakananAdmin(admin.ModelAdmin):
    list_display = ('id', 'nama', 'bahan')
    search_fields = ('nama', 'bahan', 'deskripsi')
    list_per_page = 25
