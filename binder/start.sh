#!/bin/bash

# Replace DASK_DASHBOARD_URL with the proxy location
sed -i -e "s|DASK_DASHBOARD_URL|/user/${JUPYTERHUB_USER}/proxy/8787|g" \
  ${HOME}/binder/jupyterlab-workspace.json
# Get the right workspace ID
sed -i -e "s|WORKSPACE_ID|/user/${JUPYTERHUB_USER}/lab|g" \
  ${HOME}/binder/jupyterlab-workspace.json

# # Import the workspace into JupyterLab
# jupyter lab workspaces import ${HOME}/binder/jupyterlab-workspace.json \
#   --NotebookApp.base_url=user/${JUPYTERHUB_USER}

exec "$@"
