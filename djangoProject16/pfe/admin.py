from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import *

# Register your models here.

# Register your models here.
admin.site.register(Admin)
admin.site.register(Filiere)
admin.site.register(Matiere)
admin.site.register(Annee)
admin.site.register(Student)
admin.site.register(Teacher)
admin.site.register(Seance)
admin.site.register(Attendance)

