from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    profile_pic = models.ImageField(upload_to = 'images/profile_pics', null=True, blank=True)
    is_teacher = models.BooleanField(verbose_name='Is Teacher', default=False)
    is_manager = models.BooleanField(verbose_name='Is Manager?', default=False)
    is_common_user = models.BooleanField(verbose_name='Is CommonUser?', default=True)

class Activation(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    code = models.CharField(max_length=20, unique=True)
    email = models.EmailField(blank=True)
