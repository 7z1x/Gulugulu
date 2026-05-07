from django.db import models


class Makanan(models.Model):
    id = models.IntegerField(primary_key=True)
    nama = models.CharField(max_length=50)
    bahan = models.CharField(max_length=100)
    deskripsi = models.CharField(max_length=1000)

    class Meta:
        db_table = 'makanan'

    def __str__(self):
        return self.nama
