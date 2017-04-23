from .models import Employee, Store, Order, StoreProduct, Product, OrderProduct, Sale, SaleProduct, Supplier
from django.contrib.auth.models import User
from rest_framework.serializers import ModelSerializer, ValidationError, Serializer, RelatedField, PrimaryKeyRelatedField

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['pk', 'username', 'first_name', 'last_name', 'is_superuser', 'is_staff']

class EmployeeUserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['pk', 'first_name', 'last_name', 'is_staff']

class EmployeeUserRetrieveSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'is_staff', 'is_active']

class UserEditSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['pk', 'username', 'password', 'first_name', 'last_name', 'is_staff', 'is_active']

class EmployeeStoreSerializer(ModelSerializer):
    class Meta:
        model = Store
        fields = ['pk', 'location']

class EmployeeSerializer(ModelSerializer):
    user = EmployeeUserSerializer()
    store = EmployeeStoreSerializer()

    class Meta:
        model = Employee
        fields = ['pk', 'user', 'store']

class CreateUserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'password', 'first_name', 'last_name', 'is_staff']

    def validate(self, data):
        username = data['username']
        user_qs = User.objects.filter(username=username)

        if user_qs.exists():
            raise ValidationError("Este usuario ya ha sido registrado")

        return data

class EmployeeRetrieveSerializer(ModelSerializer):
   user = EmployeeUserRetrieveSerializer()
   store = EmployeeStoreSerializer()

   class Meta:
       model = Employee
       fields = ['pk', 'user', 'store']


class EmployeeEditSerializer(Serializer):
   user = UserEditSerializer()
   store = EmployeeStoreSerializer()
   class Meta:
       model = Employee
       fields = ['pk', 'user', 'store']

class StoreSerializer(ModelSerializer):
    class Meta:
        model = Store
        fields = ['pk', 'location', 'address', 'coordinate_x', 'coordinate_y']

class CreateStoreSerializer(ModelSerializer):
    class Meta:
        model = Store
        fields = ['location', 'address', 'coordinate_x', 'coordinate_y']

class OrderSerializer(ModelSerializer):
    class Meta:
        model = Order
        fields = ['pk', 'date_hour', 'store']

class CreateOrderSerializer(ModelSerializer):
    #store_id = PrimaryKeyRelatedField(queryset=Store.objects.all())
    class Meta:
        model = Order
        fields = ['date_hour', 'store']

class BarcodeProductSerializer(ModelSerializer):
    class Meta:
        model = Product
        fields = ['barcode']

class CreateStoreProductSerializer(ModelSerializer):
    #product = BarcodeProductSerializer()
    class Meta:
        model = StoreProduct
        fields = ['store', 'product', 'quantity']

class ProductSerializer(ModelSerializer):
    #store_id = PrimaryKeyRelatedField(queryset=Store.objects.all())
    class Meta:
        model = Product
        fields = ['pk', 'barcode', 'name', 'store_price', 'supplier_price', 'image', 'supplier', 'type']

class CreateProductSerializer(ModelSerializer):
    #store_id = PrimaryKeyRelatedField(queryset=Store.objects.all())
    class Meta:
        model = Product
        fields = ['barcode', 'name', 'store_price', 'supplier_price', 'image', 'supplier', 'type']

class CreateSaleSerializer(ModelSerializer):
    class Meta:
        model = Sale
        fields = ['store', 'amount', 'client_gender', 'client_age']

class CreateSaleProductSerializer(ModelSerializer):
    class Meta:
        model = SaleProduct
        fields = ['product', 'sale', 'quantity']

class StoreProductSerializer(ModelSerializer):
    class Meta:
        model = StoreProduct
        fields = ['pk','product','store', 'quantity']

class SupplierSerializer(ModelSerializer):
    #store_id = PrimaryKeyRelatedField(queryset=Store.objects.all())
    class Meta:
        model = Supplier
        fields = ['pk', 'name']
