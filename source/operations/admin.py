
from django.contrib import admin
from django.contrib.admin import ModelAdmin
from django.utils.translation import gettext_lazy
from rangefilter.filters import DateRangeFilter
from admin_auto_filters.filters import AutocompleteFilter


from operations.models import *

# Register your models here.

admin.site.register([GenderMaster, CareProvider, Guardian, Symptom])

class CareProviderAdmin(admin.StackedInline):
    model =CareProvider
    extra = 1

class GuardianAdmin(admin.StackedInline):
    model = Guardian
    extra = 1

class SymptomsAdmin(admin.StackedInline):
    model = Symptom
    extra = 1

@admin.register(Patient)
class PatientAdmin(ModelAdmin):
    inlines = [CareProviderAdmin, GuardianAdmin, SymptomsAdmin]


admin.site.site_title = gettext_lazy("Student Health site admin")
admin.site.site_header = gettext_lazy("Student Health administration")
admin.site.index_title = gettext_lazy("Site administration")