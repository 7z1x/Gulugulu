"""
Views for the webapp app.

Setiap view hanya bertanggung jawab untuk menerima request,
memanggil service, dan mengembalikan response.
"""

from django.core.paginator import Paginator
from django.db.models import Q
from django.shortcuts import render, redirect

from .models import Makanan
from .services.search import search_makanan, search_test, get_stop_words


def index(request):
    """Halaman utama – pencarian makanan dengan TF-IDF."""
    query = request.GET.get('q', '')

    data = list(Makanan.objects.all().values())
    results, suggestion = search_makanan(data, query)

    return render(request, 'webapp/index.html', {
        'results': results,
        'query': query,
        'suggestion': suggestion,
    })


def alldata(request):
    """Halaman semua data makanan dengan pagination."""
    query = request.GET.get('q', '')

    if query:
        makanan = Makanan.objects.filter(
            Q(nama__icontains=query) |
            Q(bahan__icontains=query) |
            Q(deskripsi__icontains=query)
        )
    else:
        makanan = Makanan.objects.all()

    paginator = Paginator(makanan, 15)
    page_number = request.GET.get('page')
    makanan = paginator.get_page(page_number)

    return render(request, 'webapp/alldata.html', {
        'makanan': makanan,
        'query': query,
        'stop_words': get_stop_words(),
    })


def deletemakanan(request, id):
    """Hapus satu record makanan berdasarkan ID."""
    mkn = Makanan.objects.get(id=id)
    mkn.delete()
    return redirect('alldata')


def about_us(request):
    """Halaman tentang tim."""
    return render(request, 'webapp/about_us.html')


def test(request):
    """Debug view – tampilkan tabel TF-IDF."""
    query = request.POST.get('q', '')

    data = list(Makanan.objects.all().values())
    html_table = search_test(data, query)

    return render(request, 'webapp/search_test.html', {
        'data': html_table,
        'stop_words': get_stop_words(),
    })
