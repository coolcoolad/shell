#!/bin/bash

# 更新 APT 包索引
sudo apt-get update
read -p "APT 包索引已更新. 按回车键继续..."

# 安装 APT 依赖包
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
read -p "APT 依赖包已安装. 按回车键继续..."

# 添加 Docker 的官方 GPG 密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
read -p "Docker 官方 GPG 密钥已添加. 按回车键继续..."

# 添加 Docker APT 仓库
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
read -p "Docker APT 仓库已添加. 按回车键继续..."

# 更新 APT 包索引
sudo apt-get update
read -p "APT 包索引已更新. 按回车键继续..."

# 安装 Docker CE
sudo apt-get install -y docker-ce
read -p "Docker CE 已安装. 按回车键继续..."

# 验证 Docker 是否正确安装
sudo systemctl status docker
read -p "Docker 服务状态已检查. 按回车键继续..."

sudo docker run hello-world
read -p "Docker hello-world 容器已运行. 按回车键继续..."

# 设置包存储库和 GPG 密钥
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
read -p "NVIDIA Docker 包存储库和 GPG 密钥已设置. 按回车键继续..."

# 更新包索引
sudo apt-get update
read -p "APT 包索引已更新. 按回车键继续..."

# 安装 nvidia-container-toolkit
sudo apt-get install -y nvidia-container-toolkit
read -p "nvidia-container-toolkit 已安装. 按回车键继续..."

# 重启 Docker 服务
sudo systemctl restart docker
read -p "Docker 服务已重启. 按回车键继续..."

# 验证 NVIDIA Docker 是否正确安装
sudo docker run --gpus all nvidia/cuda:12.1.1-base-ubuntu22.04 nvidia-smi
read -p "NVIDIA Docker 安装验证已完成. 按回车键继续..."

