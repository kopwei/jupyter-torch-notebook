# 🧠 CUDA JupyterLab with PyTorch (CUDA 12.8)

This project builds a Docker image based on [`nvidia/cuda:11.8.0-cudnn-runtime-ubuntu22.04`](https://hub.docker.com/r/nvidia/cuda), with the following features:

- 🧪 JupyterLab (latest)
- 🔥 PyTorch with CUDA 11.8 support
- ✅ Compatible with `--gpus all`
- 🔐 Accepts `JUPYTER_TOKEN` as environment variable

## 📦 Image Overview

- **Base Image**: `nvidia/cuda:11.8.0-cudnn-runtime-ubuntu22.04`
- **Components Installed**:
  - `jupyterlab`
  - `torch`, `torchvision`, `torchaudio` (with CUDA 11.8)
  - Minimal Ubuntu dependencies

## 🚀 How to Run

```bash
docker run --gpus all -p 8888:8888 \
  -e JUPYTER_TOKEN=yourtoken \
  kopkop/jupyter-torch-notebook:latest
