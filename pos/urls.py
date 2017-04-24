from django.conf.urls import include, url
from .views import LoginView, AdminView, CreateEmployeeStoreView, CreateUserEmployeeView, RetrieveEmployeeView, EditUserEmployeeView, EmployeeToEditView, DeleteUserEmployeeView, RetrieveStoresView, RetrieveStoreView, EditStoreView, CreateStoreView, DeleteStoreView, RetrieveOrdersView, RetrieveOrderView, EditOrderView, DeleteOrderView, CreateOrderView, CreateStoreProductView, CreateProductView, RetrieveProductView, RetrieveProductsView, CreateProductView, EditProductView, DeleteProductView, CreateSaleView, RetrieveInventoryView, StatsProductsHourView, RetrieveInventoriesView

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
    url('^stores/new/$', CreateStoreView.as_view(), name='create-store'),
    url('^stores/(?P<pk>\d+)/$', RetrieveStoreView.as_view(), name='show-store'),
    url('^stores/(?P<pk>\d+)/edit/$', EditStoreView.as_view(), name='edit-store'),
    url('^stores/(?P<pk>\d+)/delete/$', DeleteStoreView.as_view(), name='delete-store'),
    url('^stores/(?P<pk_store>\d+)/inventory/(?P<barcode>\d+)/$', RetrieveInventoryView.as_view(), name='inventory-show'),
    url('^stores/(?P<pk_store>\d+)/inventory/$', RetrieveInventoriesView.as_view(), name='inventory'),
    url('^orders/$', RetrieveOrdersView.as_view(), name='orders'),
    url('^orders/new/$', CreateOrderView.as_view(), name='create-order'),
    url('^orders/(?P<pk>\d+)/$', RetrieveOrderView.as_view(), name='show-order'),
    url('^orders/(?P<pk>\d+)/edit/$', EditOrderView.as_view(), name='edit-order'),
    url('^orders/(?P<pk>\d+)/delete/$', DeleteOrderView.as_view(), name='delete-order'),
    url('^products/$', RetrieveProductsView.as_view(), name='products'),
    url('^products/new/$', CreateProductView.as_view(), name='create-product'),
    url('^products/(?P<barcode>\d+)/$', RetrieveProductView.as_view(), name='show-product'),
    url('^products/(?P<barcode>\d+)/edit/$', EditProductView.as_view(), name='edit-product'),
    url('^products/(?P<barcode>\d+)/delete/$', DeleteProductView.as_view(), name='delete-product'),
    url('^inventory/create/$', CreateStoreProductView.as_view(), name='create-inventory'),
    url('^sales/create/$', CreateSaleView.as_view(), name='create-sale'),
    url('^stats/sales/$', StatsProductsHourView.as_view(), name='stats-sale'),

]
