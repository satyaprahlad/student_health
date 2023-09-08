import os

from django.core.wsgi import get_wsgi_application
from django.contrib.staticfiles.handlers import StaticFilesHandler
from app import settings

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "app.settings")
if settings.DEBUG:
    application = StaticFilesHandler(get_wsgi_application())
else:
    application = get_wsgi_application()
#application = get_wsgi_application()
