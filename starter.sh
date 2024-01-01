#!/bin/sh

while ! nc -z db 5432; do
  sleep 2
done
python manage.py migrate
python manage.py createsuperuser --noinput
gunicorn django_g4.wsgi:application --bind 0.0.0.0:8001
