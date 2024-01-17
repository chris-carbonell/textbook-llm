#!/usr/bin/env bash

# generate config
jupyter notebook --generate-config
# HASHED_PASSWORD=$(python3 -c "from notebook.auth import passwd; print(passwd('${JUPYTER_PASSWORD}'))" | sed 's/\$/\\\$/g')
HASHED_PASSWORD=$(python3 -c "from notebook.auth import passwd; print(passwd('${JUPYTER_PASSWORD}'))")
echo "c.NotebookApp.password='${HASHED_PASSWORD}'" >> /root/.jupyter/jupyter_notebook_config.py

jupyter lab --ip=0.0.0.0 --allow-root --ServerApp.allow_origin=* --ServerApp.open_browser=False