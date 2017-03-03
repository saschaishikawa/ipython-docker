#!/bin/sh

# generate self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem

# copy config file
cp /ipython-docker/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
