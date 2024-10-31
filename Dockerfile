FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    apt-get install libcurl4 \
    python3-pip \
    python3-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# requirements.txtをコピー
COPY requirements.txt /workspace/requirements.txt

# Pythonパッケージのインストール
RUN pip3 install --no-cache-dir -r /workspace/requirements.txt

# 作業ディレクトリの設定
WORKDIR /workspaces

# # JupyterLabの起動コマンド
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser"]
