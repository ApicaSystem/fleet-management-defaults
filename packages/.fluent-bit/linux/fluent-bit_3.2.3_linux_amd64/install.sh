#!/bin/sh

wget https://raw.githubusercontent.com/fluent/fluent-bit/master/install.sh | sh

systemctl disable fluent-bit
