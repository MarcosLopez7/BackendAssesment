from django.conf.urls import include, url
from .views import LoginView, AdminView, CreateEmployeeStoreView, CreateUserEmployeeView, RetrieveEmployeeView

urlpatterns = [
    url('^login/$', LoginView.as_view(), name='login'),
    url('^admin/$', AdminView.as_view(), name='admin'),
    url('^creaetestoreemployee/$', CreateEmployeeStoreView.as_view(), name='store-employee'),
    url('^createemployee/$', CreateUserEmployeeView.as_view(), name='create-employee'),
    url('^employee/(?P<pk>\d+)/$', RetrieveEmployeeView.as_view(), name='employee'),
]
