#!/bin/sh

mkdir -p /opt/fluent-bit/bin

mkdir -p /etc/fluent-bit

mv fluent-bit /opt/fluent-bit/bin

mv *.conf /etc/fluent-bit
