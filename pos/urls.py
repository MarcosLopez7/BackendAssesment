from django.conf.urls import include, url
from .views import LoginView, AdminView, CreateEmployeeStoreView

urlpatterns = [
    url('^login/$', LoginView.as_view(), name='login'),
    url('^admin/$', AdminView.as_view(), name='admin'),
    url('^creaetestoreemployee/$', CreateEmployeeStoreView.as_view(), name='store-employee')
]
