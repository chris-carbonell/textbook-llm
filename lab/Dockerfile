# Overview
# build env

FROM debian:buster

WORKDIR /usr/app

RUN apt update \
    && apt install -y argon2 cmake gcc libpq-dev python3 python3-pip

COPY requirements.txt .
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install -r requirements.txt

EXPOSE 8888

# generate config
RUN jupyter notebook --generate-config
ARG JUPYTER_PASSWORD
ARG JUPYTER_PASSWORD_SALT
RUN export HASHED_PASSWORD=$(python3 -c "from notebook.auth import passwd; print(passwd('${JUPYTER_PASSWORD}'))" | sed 's/\$/\\\$/g') \
    && echo "HASHED_PASSWORD=\"${HASHED_PASSWORD}\"" >> /envfile
RUN . /envfile; echo "c.NotebookApp.password='${HASHED_PASSWORD}'" >> /root/.jupyter/jupyter_notebook_config.py

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--ServerApp.allow_origin=*", "--ServerApp.open_browser=False"]