from django.urls import path
from . import views

urlpatterns = [
    path('', views.home),
    # path('sendemail', views.sendemail),  # two parameters url and function
    path('login/', views.login),
    path('user/', views.user),
    # path('user/', views.view1),
    path('trainer/', views.trainer),
    path('view/', views.view),
    path('delete/<int:id>', views.delete),
    path('end/', views.end),
    path('check/', views.check),
    path('update/<int:id>', views.editdetails),
    path('updatedetails/', views.updatedetails),
    path('generate/', views.invoice),
    path('logout/', views.logout),
]
