# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-04-22 16:57
from __future__ import unicode_literals

from django.db import migrations, models
import pos.models


class Migration(migrations.Migration):

    dependencies = [
        ('pos', '0003_auto_20170422_0732'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='image',
            field=models.FileField(null=True, upload_to=pos.models.product_directory_path),
        ),
    ]
