
import os
import warnings
from os.path import dirname

from django.utils.translation import gettext_lazy as _
from dotenv import load_dotenv

load_dotenv()
warnings.simplefilter('error', DeprecationWarning)

BASE_DIR = dirname(dirname(os.path.abspath(__file__)))

CONTENT_DIR = os.path.join(BASE_DIR, 'content')

SECRET_KEY = os.environ.get('SECRET_KEY')

DEBUG = os.environ.get('DEBUG') == 'True'
ENVIRONMENT = os.environ.get('ENVIRONMENT')
ALLOWED_HOSTS = list(map(lambda x:x.strip(), os.environ.get('ALLOWED_HOSTS').split(',')))
import pymysql
pymysql.install_as_MySQLdb()
SITE_ID = 1
# Application definition
LOGGING = {
    'version' : 1,
    'disable_existing_loggers' : False,
    'formatters' : {
        'detailed' : {
            'format' : '{levelname} {asctime} {module} {lineno} {process:d} {thread:d} {message}',
            'style' : '{',
        }
    },
    'handlers' : {
        'console' : {
            'class' : 'logging.StreamHandler',
            'formatter' : 'detailed',
            'level': 'DEBUG'
        },
        'file' : {
            'level' : 'DEBUG',
            'class' : 'logging.handlers.RotatingFileHandler',
            'filename' : 'logs/logfile',
            'formatter' : 'detailed',
            'maxBytes': 1024*1024*5, # 5 MB
            'backupCount': 5
        }

    },
    'root' : {
        'handlers' : list(map(lambda x:x.strip(), os.environ.get('LOG_HANDLERS').split(','))),
        'level' : 'INFO'
    },
    'loggers': {
        'django': {
            'handlers':  list(map(lambda x:x.strip(), os.environ.get('LOG_HANDLERS').split(','))),
            'level': os.getenv('DJANGO_LOG_LEVEL', 'INFO'),
            'propagate': False,
        },
        'background_task': {
            'handlers': ['file'],
            'level': os.getenv('DJANGO_LOG_LEVEL', 'INFO'),
            'propagate': True,
        },

    },
}
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

    'django_bootstrap5',
    'django_forms_bootstrap',
    # Application apps
    'main',
    'accounts',
    'address',
    'myutils',
    'operations',
    'encrypted_secrets',
    'corsheaders',
    'mathfilters',
    'bootstrap_modal_forms',
    'widget_tweaks'


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
    'corsheaders.middleware.CorsMiddleware',
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

DEFAULT_FROM_EMAIL = ''
SERVER_EMAIL =  ''
EMAIL_USE_TLS = True
EMAIL_HOST = ''
EMAIL_PORT = 587
EMAIL_HOST_USER = ''
EMAIL_HOST_PASSWORD = ''
if  ENVIRONMENT == 'local':
    DATABASES = {
        "default": {
            "ENGINE": "django.db.backends.mysql",
            "NAME": os.environ.get('DATABASE_NAME'),
            "USER": os.environ.get('DATABASE_USERNAME'),
            "PASSWORD": os.environ.get('DATABASE_PASSWORD'),
            "HOST": "127.0.0.1",
            "PORT": "3306",
        }
    }
else:
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

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder'
    # other finders..
)
LOCALE_PATHS = [
    os.path.join(CONTENT_DIR, 'locale')
]

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

AUTH_USER_MODEL = 'accounts.User'
audit_fields = ['created_by', 'updated_by', 'created_at', 'updated_at']

CORS_ORIGIN_ALLOW_ALL = True
CSRF_TRUSTED_ORIGINS = ['http://localhost:4200']

medisearch_api_key =  os.environ.get("medisearch_api_key")