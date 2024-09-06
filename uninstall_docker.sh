#!/bin/bash

# 停止 Docker 服务
sudo systemctl stop docker
read -p "Docker 服务已停止. 按回车键继续..."

sudo systemctl stop docker.socket
read -p "Docker socket 已停止. 按回车键继续..."

# 卸载 Docker 相关的包
sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
read -p "Docker 相关包已卸载. 按回车键继续..."

sudo apt-get purge -y containerd runc
read -p "Containerd 和 runc 已卸载. 按回车键继续..."

# 删除 Docker 的依赖包
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce
read -p "Docker 依赖包已删除. 按回车键继续..."

sudo apt-get autoremove -y --purge containerd runc
read -p "Containerd 和 runc 依赖包已删除. 按回车键继续..."

# 删除 Docker 的数据目录
sudo rm -rf /var/lib/docker
read -p "/var/lib/docker 目录已删除. 按回车键继续..."

sudo rm -rf /var/lib/containerd
read -p "/var/lib/containerd 目录已删除. 按回车键继续..."

# 删除 Docker 的配置文件
sudo rm -rf /etc/docker
read -p "/etc/docker 目录已删除. 按回车键继续..."

sudo rm -rf /etc/systemd/system/docker.service.d
read -p "/etc/systemd/system/docker.service.d 目录已删除. 按回车键继续..."

# 删除 Docker 的网络配置
sudo rm -rf /var/run/docker.sock
read -p "/var/run/docker.sock 文件已删除. 按回车键继续..."

# 删除 Docker GPU 相关的包
sudo apt-get purge -y nvidia-docker2
read -p "nvidia-docker2 已卸载. 按回车键继续..."

sudo apt-get purge -y nvidia-container-runtime
read -p "nvidia-container-runtime 已卸载. 按回车键继续..."

sudo apt-get autoremove -y --purge nvidia-docker2
read -p "nvidia-docker2 依赖包已删除. 按回车键继续..."

sudo apt-get autoremove -y --purge nvidia-container-runtime
read -p "nvidia-container-runtime 依赖包已删除. 按回车键继续..."

# 删除 NVIDIA Docker 相关的配置文件
sudo rm -rf /etc/systemd/system/docker.service.d
read -p "/etc/systemd/system/docker.service.d 目录已删除. 按回车键继续..."

sudo rm -rf /usr/local/nvidia-docker
read -p "/usr/local/nvidia-docker 目录已删除. 按回车键继续..."

