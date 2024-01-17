# Overview
# build env

FROM debian:buster

EXPOSE 8888

WORKDIR /usr/app

RUN apt update \
    && apt install -y argon2 cmake gcc libpq-dev python3 python3-pip

COPY requirements.txt .
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install -r requirements.txt

# copy entrypoint
# for some reason, I can't execute from /usr/app
COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]