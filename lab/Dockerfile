# Overview
# build env

FROM debian:12

EXPOSE 8888

RUN apt update \
    && apt install -y cmake gcc libpq-dev python3-pip wget \
    && apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev

# install python 3.12
# https://aruljohn.com/blog/install-python-debian/
WORKDIR /usr/app/python
RUN wget https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tgz
RUN tar -xzvf Python-3.12.1.tgz
WORKDIR ./Python-3.12.1/
RUN ./configure --enable-optimizations
RUN make -j `nproc`

WORKDIR /usr/app

# install python deps
RUN apt install -y python3-venv
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt .
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install -r requirements.txt

# set up entrypoint
# for some reason, I can't execute from /usr/app
COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]