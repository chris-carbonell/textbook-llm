# Overview
# build env

FROM debian:buster

WORKDIR /usr/app

RUN apt update \
    && apt install -y cmake gcc libpq-dev python3 python3-pip

COPY requirements.txt .
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install -r requirements.txt

EXPOSE 8888

# generate config
RUN jupyter notebook --generate-config

# default
# you'll have to get the token from the logs (e.g., via Portainer)
# ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--ServerApp.allow_origin=*", "--ServerApp.open_browser=False"]

# no creds
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--ServerApp.allow_origin=*", "--ServerApp.open_browser=False", "--IdentityProvider.token=''", "--PasswordIdentityProvider.hashed_password=''"]