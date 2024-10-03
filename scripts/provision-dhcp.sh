#!/bin/bash

# Copy dhcp files to their default directories
cp -v /etc/dhcp-config/dhcpd.conf /etc/dhcp/dhcpd.conf
cp -v /etc/dhcp-config/isc-dhcp-server /etc/default/isc-dhcp-server
