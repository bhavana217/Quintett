# Generated by Django 3.1.7 on 2021-04-06 15:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quintet', '0003_auto_20210405_1625'),
    ]

    operations = [
        migrations.AlterField(
            model_name='trainers',
            name='Bank_name',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='trainers',
            name='IFSC',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='trainers',
            name='Location',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='trainers',
            name='Pan',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='trainers',
            name='domain',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='trainers',
            name='name',
            field=models.CharField(max_length=200),
        ),
    ]
