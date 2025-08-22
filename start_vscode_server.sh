#!/bin/bash

# 定义检查间隔时间（秒）
CHECK_INTERVAL=10

# 定义code-server启动命令
CODE_SERVER_CMD="nohup code-server --bind-addr 0.0.0.0:8008"

# 定义健康检查URL
HEALTH_CHECK_URL="http://localhost:8008/healthz"

# 设置密码
export PASSWORD=yd19840116

while true; do
    # 检查code-server进程是否存在
    if pgrep -f "code-server --bind-addr 0.0.0.0:8008" > /dev/null; then
        # 如果进程存在，进行健康检查
        if curl -s --head "$HEALTH_CHECK_URL" | grep "200 OK" > /dev/null; then
            echo "服务正常"
        else
            echo "服务不正常，尝试重启code-server"
            pkill -f "code-server"
            $CODE_SERVER_CMD &
        fi
    else
        # 如果进程不存在，启动code-server
        echo "code-server未运行，启动中..."
        $CODE_SERVER_CMD &
    fi

    # 等待一段时间后再次检查
    sleep $CHECK_INTERVAL
done
