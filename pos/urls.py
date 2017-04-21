from django.conf.urls import include, url
from .views import LoginView, AdminView, CreateEmployeeStoreView, CreateUserEmployeeView, RetrieveEmployeeView, EditUserEmployeeView, EmployeeToEditView, DeleteUserEmployeeView

urlpatterns = [
    url('^login/$', LoginView.as_view(), name='login'),
    url('^admin/$', AdminView.as_view(), name='admin'),
    url('^creaetestoreemployee/$', CreateEmployeeStoreView.as_view(), name='store-employee'),
    url('^createemployee/$', CreateUserEmployeeView.as_view(), name='create-employee'),
    url('^employee/(?P<pk>\d+)/$', RetrieveEmployeeView.as_view(), name='employee'),
    url('^editemployee/(?P<pk>\d+)/$', EditUserEmployeeView.as_view(), name='edit-employee'),
    url('^editstoreemployee/(?P<pk>\d+)/$', EmployeeToEditView.as_view(), name='edit-store-employee'),
    url('^deleteemployee/(?P<pk>\d+)/$', DeleteUserEmployeeView.as_view(), name='delete-employee'),
]
