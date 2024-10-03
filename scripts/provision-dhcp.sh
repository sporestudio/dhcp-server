#!/bin/bash

# Copy dhcp files to their default directories
cp -v /vagrant/dhcp-config/dhcpd.conf /etc/dhcp/dhcpd.conf
cp -v /vagrant/dhcp-config/isc-dhcp-server /etc/default/isc-dhcp-server
