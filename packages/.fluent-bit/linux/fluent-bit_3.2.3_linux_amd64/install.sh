#!/bin/sh

DIR=$PWD

wget -O fbinstall.sh https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh

if $DIR/checkmd5 --hash=095e0f5d4c081b7294dc97929724e16bd65328de7d4baf66f5cbb7750de5827d760c73e1c5e2a70b38da37519657f40c69b5d6e5e699e1dd72423f51f9d67f32 --file=fbinstall.sh; then
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
