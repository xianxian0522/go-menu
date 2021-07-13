#!/bin/bash

VERSION=$1
PACKAGE_NAME=$2
WEB_NAME=$3
SERVER_DIR=$4
BUILD_DEV=$5


local_position=`pwd`
set -e
echo "包名 $PACKAGE_NAME"

temp_dir=$(date "+%Y%m%d%H%M%S")
mkdir -p temp_dir

name=$PACKAGE_NAME-$VERSION-0
packageFile=$name.tar.gz


export GOPROXY=http://172.16.97.41:9000/repository/go-proxy/
web_file=$WEB_NAME.tar.gz

if [ ! -f "$web_file" ] && [ $BUILD_DEV == "true" ];then
  echo "未获取到前端文件"
  exit 1
fi

make


mkdir -p $PACKAGE_NAME/bin


set -x


#拷贝二进制文件和配置文件
cp -vfr ./bin/* ./$PACKAGE_NAME/bin

#拷贝启动停止脚本
cp -vfr ./stop.sh ./start.sh ./views ./public ./exportenv.sh ./$PACKAGE_NAME
if [ -f "$web_file" ];then
  cp -vfr $web_file  ./$PACKAGE_NAME
fi

tar zcf $packageFile  ./$PACKAGE_NAME

set +x
set +e
