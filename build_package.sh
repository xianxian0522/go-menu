#!/bin/bash

VERSION=$1
PACKAGE_NAME=$2
SERVER_DIR=$3



local_position=`pwd`
set -e
echo "包名 $PACKAGE_NAME"

temp_dir=$(date "+%Y%m%d%H%M%S")
mkdir -p temp_dir

name=$PACKAGE_NAME-$VERSION
packageFile=$name.tar.gz


export GOPROXY=http://172.16.97.41:9000/repository/go-proxy/


make


mkdir -p $PACKAGE_NAME/bin


set -x
saltSrc=salt-formula
saltTarget=$saltSrc/$PACKAGE_NAME
mkdir -p $saltTarget/packages
#拷贝二进制文件和配置文件
cp -vfr ./bin/* ./$PACKAGE_NAME/bin

sed -i 's/$packageName/'${PACKAGE_NAME}'/g' deploy.sls
#拷贝启动停止脚本
cp -vfr ./stop.sh ./start.sh ./views ./public ./$PACKAGE_NAME

cp  -vfr  deploy.sls  ${saltSrc}/${PACKAGE_NAME}/deploy.sls

tar zcf $packageFile  ./$PACKAGE_NAME

cp -a $packageFile $saltTarget/packages/

set +x
set +e
