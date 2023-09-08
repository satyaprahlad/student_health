import os

import warnings
from django.utils.translation import gettext_lazy as _
from os.path import dirname

warnings.simplefilter('error', DeprecationWarning)

BASE_DIR = dirname(dirname(dirname(dirname(os.path.abspath(__file__)))))

CONTENT_DIR = os.path.join(BASE_DIR, 'content')

SECRET_KEY = 'NhfTvayqggTBPswCXXhWaN69HuglgZIkM'

DEBUG = True
ALLOWED_HOSTS = []

SITE_ID = 1

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'rangefilter',
    'rest_framework',
    'admin_auto_filters',

    # Vendor apps
    'bootstrap4',
    'django_forms_bootstrap',
    'polymorphic',

    # Application apps
    'main',
    'accounts',
    'address',
    'myutils',
    'operations',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'app.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(CONTENT_DIR, 'templates'),
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'app.wsgi.application'

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_FILE_PATH = os.path.join(CONTENT_DIR, 'tmp/emails')


"""For gmail"""
# DEFAULT_FROM_EMAIL = 'b2bleadsmgmt@gmail.com'
# SERVER_EMAIL = 'b2bleadsmgmt@gmail.com'
# EMAIL_USE_TLS = True
# EMAIL_HOST = 'smtp.gmail.com'
# EMAIL_PORT = 587
# EMAIL_HOST_USER = 'b2bleadsmgmt@gmail.com'
# EMAIL_HOST_PASSWORD = 'tdsommxakmbrjjzj'
# b2bleadsmgmt@1234


DEFAULT_FROM_EMAIL = 'developer.ra@techintelli.com'
SERVER_EMAIL =  'developer.ra@techintelli.com'
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.office365.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'developer.ra@techintelli.com'
EMAIL_HOST_PASSWORD = 'Satya@0000'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

ENABLE_USER_ACTIVATION = True
DISABLE_USERNAME = False
LOGIN_VIA_EMAIL = True
LOGIN_VIA_EMAIL_OR_USERNAME = True
LOGIN_REDIRECT_URL = 'index'
LOGIN_URL = 'accounts:log_in'
USE_REMEMBER_ME = True

RESTORE_PASSWORD_VIA_EMAIL_OR_USERNAME = False
ENABLE_ACTIVATION_AFTER_EMAIL_CHANGE = True

SIGN_UP_FIELDS = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']
if DISABLE_USERNAME:
    SIGN_UP_FIELDS = ['first_name', 'last_name', 'email', 'password1', 'password2']

MESSAGE_STORAGE = 'django.contrib.messages.storage.cookie.CookieStorage'


LANGUAGE_CODE = 'en'
LANGUAGES = [
    ('en', _('English')),
    ('ru', _('Russian')),
    ('zh-Hans', _('Simplified Chinese')),
    ('fr', _('French')),
    ('es', _('Spanish')),
    ('te',_('Telugu'))
]

TIME_ZONE =  'Asia/Kolkata'
USE_TZ = False

STATIC_ROOT = os.path.join(CONTENT_DIR, 'static')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(CONTENT_DIR, 'media')
MEDIA_URL = '/media/'

STATICFILES_DIRS = [
    os.path.join(CONTENT_DIR, 'assets'), os.path.join(CONTENT_DIR, 'media'),
]

LOCALE_PATHS = [
    os.path.join(CONTENT_DIR, 'locale')
]

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


