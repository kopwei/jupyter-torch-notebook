FROM nvidia/cuda:12.8.1-cudnn-runtime-ubuntu24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV UV_VENV_PATH=/opt/venv
ENV PATH="${UV_VENV_PATH}/bin:$PATH"

# Set bash as the default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /app/

# Build with some basic utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    apt-utils \
    vim \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install UV package manager
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

# 创建 venv（uv venv 自动管理）
RUN uv venv "$UV_VENV_PATH"

# 复制 pyproject.toml
COPY pyproject.toml .

# 安装依赖（无缓存，全局安装）
RUN uv pip install --index-strategy unsafe-best-match --no-cache-dir .

# 添加启动脚本
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 容器启动时执行
ENTRYPOINT ["/start.sh"]
