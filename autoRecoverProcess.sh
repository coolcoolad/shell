#! /bin/sh
while true
do
	if (ps -ef|grep ssserver |grep -v grep)
    then 
		echo "-----------------------------------------"
		echo "DB进程守护: DB服务运行中..." 
		date 
		sleep 3
	
    else
    	 echo "-----------------------------------------"
		 echo "DB守护: DB挂了！！！" 
		 date    
		 echo "DB守护: 尝试重新启动DB服务..."
		nohup sh sss.sh &
    	sleep 2
	fi
done
