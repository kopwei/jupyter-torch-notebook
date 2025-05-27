#!/bin/bash

# 默认 token 如果未设置
: "${JUPYTER_TOKEN:=default-token}"

export PATH="/opt/venv/bin:$PATH"

exec jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token="$JUPYTER_TOKEN"