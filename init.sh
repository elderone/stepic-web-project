#!/bin/bash

sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/hello.py /etc/gunicorn.d/hello.py

pip3 install django==1.10.3 gunicorn==19.6.0
sed -i -e "s@/usr/bin/python@/usr/bin/python3@g" /usr/sbin/gunicorn-debian /usr/bin/gunicorn /usr/bin/gunicorn_django /usr/bin/gunicorn_paster
sed -i -e "s@gunicorn==17.5@gunicorn==19.6.0@g" /usr/bin/gunicorn /usr/bin/gunicorn_django /usr/bin/gunicorn_paster
sudo ln -sf /home/box/web/etc/gunicorn-wsgi.conf /etc/gunicorn.d/test-wsgi
sudo ln -sf /home/box/web/etc/gunicorn-django.conf /etc/gunicorn.d/test-django
sudo /etc/init.d/gunicorn restart