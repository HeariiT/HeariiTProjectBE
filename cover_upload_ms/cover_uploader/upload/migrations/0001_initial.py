# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-06 03:04
from __future__ import unicode_literals

from django.db import migrations, models
import upload.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Covers',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image_loc', models.ImageField(upload_to=upload.models.filenameChange, verbose_name='Uploaded Image')),
                ('song_id', models.IntegerField(default=0, unique=True)),
            ],
        ),
    ]