from django.conf.urls import include, url
from .views import LoginView, AdminView, CreateEmployeeStoreView, CreateUserEmployeeView, RetrieveEmployeeView, EditUserEmployeeView, EmployeeToEditView, DeleteUserEmployeeView, RetrieveStoresView, RetrieveStoreView, EditStoreView, CreateStoreView, DeleteStoreView, RetrieveOrdersView, RetrieveOrderView, CreateOrderView, CreateStoreProductView

urlpatterns = [
    url('^login/$', LoginView.as_view(), name='login'),
    url('^admin/$', AdminView.as_view(), name='admin'),
    url('^creaetestoreemployee/$', CreateEmployeeStoreView.as_view(), name='store-employee'),
    url('^createemployee/$', CreateUserEmployeeView.as_view(), name='create-employee'),
    url('^employee/(?P<pk>\d+)/$', RetrieveEmployeeView.as_view(), name='employee'),
    url('^editemployee/(?P<pk>\d+)/$', EditUserEmployeeView.as_view(), name='edit-employee'),
    url('^editstoreemployee/(?P<pk>\d+)/$', EmployeeToEditView.as_view(), name='edit-store-employee'),
    url('^deleteemployee/(?P<pk>\d+)/$', DeleteUserEmployeeView.as_view(), name='delete-employee'),
    url('^stores/$', RetrieveStoresView.as_view(), name='stores'),
    url('^stores/(?P<pk>\d+)/$', RetrieveStoreView.as_view(), name='show-store'),
    url('^stores/(?P<pk>\d+)/edit/$', EditStoreView.as_view(), name='show-store'),
    url('^stores/new/$', CreateStoreView.as_view(), name='create-store'),
    url('^stores/(?P<pk>\d+)/delete/$', DeleteStoreView.as_view(), name='delete-store'),
    url('^orders/$', RetrieveOrdersView.as_view(), name='orders'),
    url('^orders/(?P<pk>\d+)$', RetrieveOrderView.as_view(), name='show-order'),
    url('^orders/new/$', CreateOrderView.as_view(), name='create-order'),
    url('^inventory/create$', CreateStoreProductView.as_view(), name='create-inventory'),
]
