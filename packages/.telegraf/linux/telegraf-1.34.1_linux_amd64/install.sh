#!/bin/sh

DIR=$PWD

mkdir -p /opt/telegraf

cd /opt/telegraf

wget -O telegraf-1.34.1_linux_amd64.tar.gz https://dl.influxdata.com/telegraf/releases/telegraf-1.34.1_linux_amd64.tar.gz

if $DIR/checkmd5 --hash=57e7a49efbf458d70e95b3e1f38ca103b6124b82d86811f76918c57acdbe17ae6152e436593c16e20ce6f88384e9bc5a57f719c86aebb63f080d4ea87ce4f575 --file=telegraf-1.34.1_linux_amd64.tar.gz; then
    tar -xzvf telegraf-1.34.1_linux_amd64.tar.gz
    cd telegraf-1.34.1
    mv * ..
    cd ..
    rm -r telegraf-1.34.1*
    cp -R ./etc/* /etc
    rm -rf ./etc
    cp -R ./usr/bin/ ./
    cp -R ./usr/lib/ ./
    rm -rf ./usr
    cp -R ./var/* /var/
    rm -rf ./var
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi


