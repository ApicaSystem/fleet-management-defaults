#!/bin/sh

DIR=$PWD

mkdir -p /opt/prometheus/bin/

cd /opt/prometheus/bin/

wget -O prometheus.tar.gz https://github.com/prometheus/prometheus/releases/download/v3.0.1/prometheus-3.0.1.linux-amd64.tar.gz

if $DIR/checkmd5 --hash=52bad8b7541b6c70d7c452feb584be00be3e2c7637078fdf61574183a962fa3369c182453d6bb1ac84ead140a4e9bdb6beeaa0c132c2586b6918596f1b8c02b8 --file=prometheus.tar.gz; then
    tar -xzvf prometheus.tar.gz;
    cd prometheus-3.0.1.linux-amd64
    mv * ..
    cd ..
    rm -r prometheus-3.0.1.linux-amd64
    mkdir -p /etc/prometheus/;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi


