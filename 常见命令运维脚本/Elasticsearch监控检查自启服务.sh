#!/bin/bash
cd `dirname $0`
BIN_DIR=`pwd`
#jdk路径，这里有个坑，下文会讲
#export JAVA_HOME=/home/release/jdk-13.0.2
#获取es进程ID，我的es目录是/home/pangu/app/elastic/elasticsearch-master
ES_ID=`ps -ef |grep -w 'elasticsearch9302/config'|grep -v 'grep'|awk '{print $2}'`
#启动脚本目录
StartES=/home/release/elasticsearch9302/bin/elasticsearch
#日志输出
ESMonitorLog=$BIN_DIR/es-master-monitor.log
Monitor()
{
  if [[ $ES_ID ]];then # 这里判断ES进程是否存在
    echo "[info][$(date "+%Y-%m-%d %H:%M:%S")]当前ES9202进程ID为:$ES_ID"
  else
    echo "[error][$(date "+%Y-%m-%d %H:%M:%S")]ES9202进程不存在!ES9202开始自动重启..."
    sh $StartES -d -p pid
  fi
}
Monitor>>$ESMonitorLog