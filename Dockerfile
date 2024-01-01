FROM python:3.12

RUN apt-get update \
    && apt-get install -y postgresql-client && apt-get install -y netcat-openbsd

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN pip install -r requirements.txt

RUN python manage.py collectstatic --noinput

