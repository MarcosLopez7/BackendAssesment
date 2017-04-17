# -*- coding: utf-8 -*-

from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from django.shortcuts import render
from django.contrib.auth import login, logout, authenticate

from .serializers import UserSerializer
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

                return Response(serializer.data, status=status.HTTP_202_ACCEPTED)

            else:
                return Response('invalid', status=status.HTTP_401_UNAUTHORIZED)

        else:
            return Response('invalid', status=status.HTTP_401_UNAUTHORIZED)
