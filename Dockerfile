# Overview
# build env

FROM python:slim

WORKDIR /usr/app

RUN apt-get update \
    && apt-get install -y gcc libpq-dev

COPY requirements.txt .
RUN python -m pip install --upgrade pip \
    && python -m pip install -r requirements.txt

EXPOSE 8888

# generate config
RUN jupyter notebook --generate-config

# default
# you'll have to get the token from the logs (e.g., via Portainer)
# ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--ServerApp.allow_origin=*", "--ServerApp.open_browser=False"]

# no creds
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--ServerApp.allow_origin=*", "--ServerApp.open_browser=False", "--IdentityProvider.token=''", "--PasswordIdentityProvider.hashed_password=''"]