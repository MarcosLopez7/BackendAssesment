# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-04-22 21:43
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pos', '0007_client_sale_saleproduct'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sale',
            name='date',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
