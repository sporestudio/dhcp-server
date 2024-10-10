#!/usr/bin/env bash

## This script updates the repositories and
## provides the server with its config files

machine_name=$1

# DHCP server function
function setup_dhcp() {
  echo -e "Installing DHCP server in $machine_name..."
  apt-get install -y isc-dhcp-server

  # Providing files
  cp -v /vagrant/dhcp-config/dhcpd.conf /etc/dhcp/dhcpd.conf
  cp -v /vagrant/dhcp-config/isc-dhcp-server /etc/default/isc-dhcp-server

  # Restarting service
  systemctl restart isc-dhcp-server
}

# General configurations
function general_provision() {
  echo -e "Updating and upgrading the repositories in $machine_name..."
  apt-get update -y && apt-get upgrade -y
}

# Program flow
function main() {
  if [ "$machine_name" == "server" ]; then
    general_provision
    setup_dhcp
  elif [[ "$machine_name" == "client1" || "$machine_name" == "client2" ]]; then
    general_provision
  else
    echo -e "Machine not recognized"
    exit 1
  fi
}

main
