# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-09-23 07:44
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('upload', '0002_auto_20170921_2228'),
    ]

    operations = [
        migrations.RenameField(
            model_name='uploadimage',
            old_name='image',
            new_name='image_loc',
        ),
    ]