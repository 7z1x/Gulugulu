"""
URL patterns for the webapp app.
"""
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('search/', views.index, name='search'),
    path('alldata/', views.alldata, name='alldata'),
    path('alldata/', views.alldata, name='alldata_search'),
    path('test/', views.test, name='test'),
    path('deletemakanan/<int:id>', views.deletemakanan, name='deletemakanan'),
    path('about_us/', views.about_us, name='about_us'),
]
