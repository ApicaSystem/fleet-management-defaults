#!/bin/sh

DIR=$PWD

mkdir -p /opt/otelcol/bin/

cd /opt/otelcol/bin/

wget -O otelcol-contrib_0.116.1_linux_amd64.tar.gz https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.116.1/otelcol-contrib_0.116.1_linux_amd64.tar.gz

if $DIR/checkmd5 --hash=f81e092d84bc6dee93a2eae36674e84d25434080a71359584731f85f5c4bfb5ca173740d99bf0c5b4a8b65286b5e3c329835d1eb5feaaec3643ab843ba7eee2f --file=otelcol-contrib_0.116.1_linux_amd64.tar.gz; then
    tar -xzvf otelcol-contrib_0.116.1_linux_amd64.tar.gz;
    mkdir -p /etc/otelcol/;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi
