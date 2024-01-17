# Overview
# build env

FROM debian:12

EXPOSE 8888

RUN apt update \
    && apt install -y cmake gcc libpq-dev python3 python3-pip

WORKDIR /usr/app

# install python deps
COPY requirements.txt .
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install -r requirements.txt --break-system-packages

# set up entrypoint
# for some reason, I can't execute from /usr/app
COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]