#!/bin/sh

DIR=$PWD

mkdir -p /opt/grafana-alloy/bin/

cd /opt/grafana-alloy/bin/

wget -O alloy-1.4.1.zip https://github.com/grafana/alloy/releases/download/v1.4.1/alloy-linux-amd64.zip
if $DIR/checkmd5 --hash=84dc0915b84ad3755325b527c03e361970a10183a08feb4ba55dd0c10425a7e4628a7d8b9aa708a6522ebbcef60f0af65fe38a4e50d55a0f486f550ae36cafdb --file=alloy-1.4.1.zip; then
    sudo apt-get install unzip;
    unzip alloy-1.4.1.zip;
    mv alloy-linux-amd64 grafana-alloy;
    chmod +x grafana-alloy;
    mkdir -p /etc/grafana-alloy/;
    cd /etc/grafana-alloy;
    touch index.log;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi
