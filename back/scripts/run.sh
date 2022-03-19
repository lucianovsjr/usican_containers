#!/bin/sh

cd /api_usican/
python manage.py migrate
python manage.py createsuperuser --no-input
RUN python manage.py collectstatic --noinput
python manage.py loaddata seed/*.json
gunicorn --bind :8000 --workers 3 api_usican.wsgi
