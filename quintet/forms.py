from django import forms
from quintet.models import Users, Trainers, Users1, college


class UsersForm(forms.ModelForm):
    class Meta:
        model = Users
        fields = "__all__"


class TrainerForm(forms.ModelForm):
    class Meta:
        model = Trainers
        fields = "__all__"


class UsersForm1(forms.ModelForm):
    class Meta:
        model = Users1
        fields = "__all__"


class CollegeForm(forms.ModelForm):
    class Meta:
        model = college
        fields = "__all__"
