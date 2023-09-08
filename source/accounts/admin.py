from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin


from accounts.models import User

admin.site.disable_action('delete_selected')
class MyUserAdmin(UserAdmin):
    fieldsets = UserAdmin.fieldsets + (
        ('Type Of User', {'fields': ('is_manager', 'is_common_user', 'profile_pic', 'is_teacher')}),
    )
admin.site.register(get_user_model(), MyUserAdmin)