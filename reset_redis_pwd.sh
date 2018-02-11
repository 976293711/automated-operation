#!/bin/bash

. include/common.sh # 引入常量文件
. include/public.sh # 引入公用函数

. include/sysinfo.sh # 输出系统信息

reset_redis_pwd(){

	read -p "Please input New Redis root password (default:root) : " redis_root_pass
	redis_root_pass=${redis_root_pass:=root} # 提供默认      

    service redis stop # 停止服务

    # 修改密码
    sed -i "s@requirepass@requirepass ${redis_root_pass}@g" $redis_install_dir/etc/${redis_port}.conf  # 登录密码 配置文件
    sed -i "s@PASSWORD=root@PASSWORD=${redis_root_pass}@g" /etc/init.d/redis  # 登录密码 脚本服务

	service redis start # 启动服务
    if [ $? == 0 ]; then
		echo -e "New Redis server root password is \033[41m $redis_root_pass \033[0m"		
	else
		echo -e "fail"	
	fi
}
reset_redis_pwd
