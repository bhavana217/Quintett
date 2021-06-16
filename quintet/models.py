from django.core.validators import RegexValidator
from django.db import models
from django.forms import ModelForm, Textarea
from django.urls import reverse

alphanumeric = RegexValidator(r'^[0-9a-zA-Z]*$', 'Only alphanumeric characters are allowed.')


# Create your models here.
class Users(models.Model):
    name = models.CharField(max_length=20)
    # collegeid = models.CharField(max_length=20)
    emailid = models.EmailField()
    collegename = models.CharField(max_length=200)
    datestart = models.DateField()
    dateend = models.DateField()
    duration = models.IntegerField()
    training = models.CharField(max_length=20)
    domain = models.CharField(max_length=20)
    food = models.CharField(max_length=10)

    class Meta:
        db_table = "users"


class Trainers(models.Model):
    name = models.CharField(max_length=200)
    emailid = models.EmailField()
    domain = models.CharField(max_length=200)
    bank_acc_number = models.BigIntegerField()
    IFSC = models.CharField(max_length=11, validators=[alphanumeric])
    Pan = models.CharField(max_length=10, validators=[alphanumeric])
    Bank_name = models.CharField(max_length=200)
    Location = models.CharField(max_length=200)
    fees = models.IntegerField()

    class Meta:
        db_table = "trainers"


class Admin(models.Model):
    email = models.EmailField()
    password = models.CharField(max_length=32)

    class Meta:
        db_table = "admin"


class Users1(models.Model):
    name = models.CharField(max_length=20)
    # collegeid = models.CharField(max_length=20)
    emailid = models.EmailField()
    collegename = models.CharField(max_length=200)
    datestart = models.DateField()
    dateend = models.DateField()
    duration = models.IntegerField()
    training = models.CharField(max_length=20)
    domain = models.CharField(max_length=20)
    food = models.CharField(max_length=10)
    travel = models.IntegerField()

    class Meta:
        db_table = "users1"


class college(models.Model):
    collegename = models.CharField(max_length=200)
    collegeid = models.CharField(max_length=20)

    class Meta:
        db_table = 'college'
