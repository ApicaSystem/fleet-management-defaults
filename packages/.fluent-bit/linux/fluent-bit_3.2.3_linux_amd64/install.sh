#!/bin/sh

DIR=$PWD

wget -O fbinstall.sh https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh

if $DIR/checkmd5 --hash=d9a311aba2b23f9e3d87a3eec426d1ae8984f88f5126e256e25bae4f9fb10fc07db563e3d56e9ef5098a8976fca27939377bd48871d28040bbf2d9841fbdfe40 --file=fbinstall.sh; then
    sed 's/^curl /wget -qO- /' fbinstall.sh > fbinst.sh
    rm fbinstall.sh;
    rm -f /etc/fluent-bit/fluent-bit.conf;
    rm -f /etc/fluent-bit/parsers.conf;
    rm -f /etc/fluent-bit/plugins.conf;
    chmod +x ./fbinst.sh;
    FLUENT_BIT_RELEASE_VERSION=3.2.3 ./fbinst.sh;
    rm fbinst.sh;
    systemctl disable fluent-bit;
else
    echo "Downloaded install files do not match checksum";
    exit 1;
fi
