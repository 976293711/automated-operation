#!/bin/bash     

pushd $src_dir # 切换

# 解压
tar -zxvf $logstash_install_dir

# 移动目录 + 重命名
mv $logstash_version $logstash_install_dir 

# 只进行安装，配置文件自行配置

