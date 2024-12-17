#!/bin/sh

DIR=$PWD

mkdir -p /opt/otelcol/bin/

cd /opt/otelcol/bin/

wget -O otelcol-contrib_0.112.0_linux_amd64.tar.gz https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.112.0/otelcol-contrib_0.112.0_linux_amd64.tar.gz

if $DIR/checkmd5 --hash=3ebb159a300e0b1325bfc6853071a29babbf4d7944eb4726239ad46a67932076b3adb602655f69472e9162609c591ce0496c9d878658dcbe340f4b6d4d4bfdfb --file=otelcol-contrib_0.112.0_linux_amd64.tar.gz; then
    tar -xzvf otelcol-contrib_0.112.0_linux_amd64.tar.gz;
    mkdir -p /etc/otelcol/;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi
