#!/bin/sh

DIR=$PWD

mkdir -p /opt/prometheus/bin/

cd /opt/prometheus/bin/

wget -O prometheus.tar.gz https://github.com/prometheus/prometheus/releases/download/v3.0.0-beta.0/prometheus-3.0.0-beta.0.linux-amd64.tar.gz


if $DIR/checkmd5 --hash=283b7d91fce7e9c93c7d416cf821d473544902fef73e75e0b7149b0d0e000e3c9cf8fd1bd1d3103a4777d054ce5ad624d5f926e96753271bcb048621a8e18873 --file=prometheus.tar.gz; then
    tar -xzvf prometheus.tar.gz;
    cd prometheus-3.0.0-beta.0.linux-amd64
    mv * ..
    cd ..
    mkdir -p /etc/prometheus/;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi


