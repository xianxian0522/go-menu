#!/bin/bash

start_name=go-menu
originalDir=`pwd`
bashFileDir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"
serviceDir="$( cd "${bashFileDir}/bin" && pwd )"

echo "生成配置文件"
sh exportenv.sh $ENV
echo "启动内容"

cname=$start_name
configFile="./"go-menu.yaml
name=$bashFileDir\/menu.log
start_name=$serviceDir\/${start_name}
echo "current config file is" $configFile
nohup  $start_name -c $configFile  > $name 2>&1 &
if [ $? -ne 0 ]; then
     echo $! > PID
     echo "启动失败"
     exit 1
fi
echo $! > PID
