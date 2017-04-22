from django.contrib import admin
from .models import (
    Employee,
    Store,
    Order,
    Supplier,
    Product,
    StoreProduct,
    OrderProduct,
    Client,
    Sale,
    SaleProduct
)
# Register your models here.
admin.site.register(Store)
admin.site.register(Employee)
admin.site.register(Order)
admin.site.register(Supplier)
admin.site.register(Product)
admin.site.register(StoreProduct)
admin.site.register(OrderProduct)
admin.site.register(Client)
admin.site.register(Sale)
admin.site.register(SaleProduct)
