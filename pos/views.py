# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.contrib.auth import login, logout, authenticate
from django.db.models import Sum, Max, Min

from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly, IsAdminUser

from .serializers import UserSerializer, EmployeeSerializer, EmployeeStoreSerializer, CreateUserSerializer, EmployeeRetrieveSerializer, EmployeeEditSerializer, UserEditSerializer, EmployeeStoreSerializer, StoreSerializer, CreateStoreSerializer, OrderSerializer, CreateOrderSerializer, CreateStoreProductSerializer, ProductSerializer, CreateProductSerializer, CreateSaleSerializer, CreateSaleProductSerializer, StoreProductSerializer, ShowStoreProductSerializer
from .models import Employee, Store, Order, Product, OrderProduct, StoreProduct, Sale, SaleProduct

from decimal import Decimal
from datetime import datetime, timedelta
import pytz
# Create your views here.
class LoginView(APIView):

    def post(self, request):

        username = self.request.data['username']
        password = self.request.data['password']

        user = authenticate(username=username, password=password)

        if user is not None:

            if user.is_active:

                login(request, user)
                serializer = UserSerializer(user)
                response = serializer.data
                if not user.is_superuser:
                    #serializer['store'] = user.employee.store
                    response['store'] = user.employee.store.pk

                return Response(response, status=status.HTTP_202_ACCEPTED)
            else:
                return Response('invalid', status=status.HTTP_401_UNAUTHORIZED)

        else:
            return Response('invalid', status=status.HTTP_401_UNAUTHORIZED)

class AdminView(ListAPIView):
    #authentication_classes = (SessionAuthentication, BasicAuthentication)
    #permission_classes = (IsAdminUser,)
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer

class CreateEmployeeStoreView(ListAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Store.objects.all()
    serializer_class = EmployeeStoreSerializer

class CreateUserEmployeeView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateUserSerializer(data=self.request.data)

        if serializer.is_valid():
            instance = serializer.save()
            instance.set_password(self.request.data['password'])
            instance.save()

            store_location = self.request.data['store']
            store = Store.objects.get(location=store_location)

            employee = Employee()
            employee.user = instance
            employee.store = store
            employee.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class RetrieveEmployeeView(RetrieveAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Employee.objects.all()
    serializer_class = EmployeeRetrieveSerializer
    lookup_field = 'pk'


class EmployeeToEditView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def get(self, request, pk):
        instance = Employee.objects.filter(pk=pk)
        stores = Store.objects.all().exclude(location__exact=instance[0].store.location)
        store_serializer = EmployeeStoreSerializer(stores, many=True)
        serializer = EmployeeEditSerializer(instance, many=True)
        response = serializer.data + store_serializer.data

        return Response(response, status=status.HTTP_202_ACCEPTED)


class EditUserEmployeeView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def put(self, request, pk):

        instance_employee = Employee.objects.get(pk=pk)
        serializer = UserEditSerializer(data=request.data, instance=instance_employee.user)

        if serializer.is_valid():
            store_location = self.request.data['store']
            store = Store.objects.get(location=store_location)

            instance_employee.user = serializer.save()
            instance_employee.store = store
            instance_employee.save()

            return Response('updated', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)


class DeleteUserEmployeeView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def delete(self, request, pk):
        employee = Employee.objects.get(pk=pk)
        employee.user.delete()
        employee.delete()

        return Response('deleted', status=status.HTTP_202_ACCEPTED)

class RetrieveStoresView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def get(self, request):
        stores = Store.objects.all()
        store_serializer = StoreSerializer(stores, many=True)
        response = store_serializer.data

        return Response(response, status=status.HTTP_202_ACCEPTED)

class RetrieveStoreView(RetrieveAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Store.objects.all()
    serializer_class = StoreSerializer
    lookup_field = 'pk'

class EditStoreView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def put(self, request, pk):

        instance_store = Store.objects.get(pk=pk)
        serializer = StoreSerializer(data=self.request.data, instance=instance_store)

        if serializer.is_valid():
            serializer.save()

            return Response('updated', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class CreateStoreView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateStoreSerializer(data=self.request.data)

        if serializer.is_valid():
            instance = serializer.save()
            instance.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class DeleteStoreView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def delete(self, request, pk):
        store = Store.objects.get(pk=pk)
        # orders = Order.objects.get(store=store)
        # products = StoreProduct.objects.get(store=store)
        # employees = Employee.objects.get(store=store)
        store.delete()

        return Response('deleted', status=status.HTTP_202_ACCEPTED)

class RetrieveOrdersView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def get(self, request):
        orders = Order.objects.all()
        order_serializer = OrderSerializer(orders, many=True)
        response = order_serializer.data

        return Response(response, status=status.HTTP_202_ACCEPTED)

class RetrieveOrderView(RetrieveAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    lookup_field = 'pk'

class CreateOrderView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateOrderSerializer(data=self.request.data)
        if serializer.is_valid():
            serializer.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class EditOrderView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def put(self, request, pk):

        instance = Order.objects.get(pk=pk)
        serializer = OrderSerializer(data=self.request.data, instance=instance)

        if serializer.is_valid():
            serializer.save()

            return Response('updated', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class DeleteOrderView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def delete(self, request, pk):
        order = Order.objects.get(pk=pk)
        # orders = Order.objects.get(store=store)
        # products = StoreProduct.objects.get(store=store)
        # employees = Employee.objects.get(store=store)
        order.delete()

        return Response('deleted', status=status.HTTP_202_ACCEPTED)


class CreateStoreProductView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        barcode = self.request.data['barcode']
        product = Product.objects.get(barcode=barcode)
        order_param = self.request.data['order']
        order = Order.objects.get(pk=order_param)

        serializer = CreateStoreProductSerializer(data={
            'store': self.request.data['store'],
            'product': product.pk,
            'quantity': 1
        })


        order_product = OrderProduct.objects.filter(product=product, order=order)
        #order = order_product.order.id

        if not order_product.exists():
            return Response('not found', status=status.HTTP_404_NOT_FOUND)

        if serializer.is_valid():
            exists = StoreProduct.objects.filter(product=product, store=self.request.data['store']).first()
            if exists:
                exists.quantity+=1
                exists.save(update_fields=['quantity'])
            else:
                order_product = serializer.save()
            #order_product.product = product

            #order_product.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class RetrieveProductsView(APIView):
    def get(self, request):
        products = Product.objects.all()
        product_serializer = ProductSerializer(products, many=True)
        response = product_serializer.data

        return Response(response, status=status.HTTP_202_ACCEPTED)

class RetrieveProductView(RetrieveAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    lookup_field = 'pk'


class CreateProductView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateStoreProductSerializer(data=self.request.data)

        if serializer.is_valid():
            instance = serializer.save()
            instance.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class EditProductView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def put(self, request, pk):

        instance = Product.objects.get(pk=pk)
        serializer = ProductSerializer(data=self.request.data, instance=instance)

        if serializer.is_valid():
            serializer.save()

            return Response('updated', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class DeleteProductView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def delete(self, request, pk):
        product = Product.objects.get(pk=pk)
        # orders = Order.objects.get(store=store)
        # products = StoreProduct.objects.get(store=store)
        # employees = Employee.objects.get(store=store)
        product.delete()

        return Response('deleted', status=status.HTTP_202_ACCEPTED)


class CreateSaleView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateSaleSerializer(data={
            'store': self.request.data['store'],
            'amount': 0.00,
        })

        if 'gender' in self.request.data:
            serializer['client_gender'] = self.request.data['gender']
        if 'age' in self.request.data:
            serializer['client_age'] = self.request.data['age']

        if serializer.is_valid():
            sale = serializer.save()
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

        amount = 0.00
        for product in self.request.data['products']:
            barcode = product['barcode']
            prod = Product.objects.get(barcode=barcode)
            quantity = product['quantity']
            saleproduct_serializer = CreateSaleProductSerializer(data = {
                'product': prod.pk,
                'quantity': quantity,
                'sale' : sale.pk
            })
            sale.amount += Decimal(prod.store_price) * quantity
            if saleproduct_serializer.is_valid():
                saleproduct_serializer.save()
            else:
                return Response(saleproduct_serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)


        sale.save(update_fields=['amount'])
        print (sale.date)
        if Sale.objects.get(pk=sale.id).amount == sale.amount:
            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class RetrieveInventoriesView(APIView):
    def get(self, request, pk_store):
        store_products = StoreProduct.objects.filter(store=pk_store)
        store_product_serializer = ShowStoreProductSerializer(store_products, many=True)
        response = store_product_serializer.data
        return Response(response, status=status.HTTP_202_ACCEPTED)

class RetrieveInventoryView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def get(self, request, pk_store, barcode):
        product = Product.objects.filter(barcode=barcode)
        if product.exists():
            store_product = StoreProduct.objects.filter(product=product[0], store=pk_store)
            if store_product.exists():
                store_product_serializer = StoreProductSerializer(store_product[0])
                response = store_product_serializer.data
                return Response(response, status=status.HTTP_202_ACCEPTED)
            else:
                return Response('not found', status=status.HTTP_404_NOT_FOUND)

        else:
            return Response('not found', status=status.HTTP_404_NOT_FOUND)

class StatsProductsHourView(APIView):
    def get(self, request):

        step = timedelta(hours=1)
        response = {}
        response['products'] = []
        num = 10
        product = None
        nosale = False
        if 'step' in self.request.GET:
            if self.request.GET['step'] == 'day':
                step = timedelta(days=1)
            if self.request.GET['step'] == 'month':
                step = timedelta(days=30)
            if self.request.GET['step'] == 'year':
                step = timedelta(days=365)

        if 'num' in self.request.GET:
            if self.request.GET['num'].isdigit():
                num = int(self.request.GET['num'])

        for i in range(num):
            end = pytz.utc.localize(datetime.utcnow() ) - (i * step)
            start = pytz.utc.localize( datetime.utcnow() ) - ((i+1) * step)
            sales = Sale.objects.filter(date__range=(start, end))

            temp = SaleProduct.objects.values('product').filter(sale__in=sales)
            if 'opt' in self.request.GET:
                if self.request.GET['opt'] == 'min':
                    temp = temp.annotate(sumQ=Sum('quantity')).aggregate(Min('sumQ'))['sumQ__min']

                elif self.request.GET['opt'] == 'max':
                    temp = temp.annotate(sumQ=Sum('quantity')).aggregate(Max('sumQ'))['sumQ__max']
                else:
                    temp = temp.annotate(sumQ=Sum('quantity')).aggregate(Max('sumQ'))['sumQ__max']
            else:
                temp = temp.annotate(sumQ=Sum('quantity')).aggregate(Max('sumQ'))['sumQ__max']
            res = SaleProduct.objects.values('product').filter(sale__in=sales).annotate(sumQ=Sum('quantity')).filter(sumQ=temp)

            products = Product.objects.all()
            for product in products:
                query = sales.filter(saleproduct__product=product)
                if len(query) == 0:
                    product = product
                    quantity = 0
                    nosale = True

            if res.exists():
                if not nosale:
                    product_id = res.values_list('product', flat=True).first()
                    quantity = res.values_list('sumQ', flat=True).first()
                    product = Product.objects.get(pk=product_id)
                serializer = ProductSerializer(product)
                product_json = serializer.data
                product_json['start_date'] = start
                product_json['end_date'] = end
                product_json['quantity'] = quantity
                response['products'].append(product_json)
                nosale = False
            elif nosale:
                serializer = ProductSerializer(product)
                product_json = serializer.data
                product_json['start_date'] = start
                product_json['end_date'] = end
                product_json['quantity'] = quantity
                response['products'].append(product_json)
                nosale = False

                #response = product_serializer.data
            #response['products'] = ProductSerializer
        return Response(response, status=status.HTTP_202_ACCEPTED)
