# -*- mode: ruby -*-
# vi: set ft=ruby :
# DHCP PROJECT - 1 server and 2 clients
# Jorge Rodriguez Castillo

$provider = "virtualbox"

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.provider $provider
  config.vm.synced_folder "dhcp-config/", "/etc/dhcp-config/"

  config.vm.provision "shell",
    path: "scripts/provision-general.sh" 

  config.vm.define "client1" do |c1|
    c1.vm.network "private_network",
      type: "dhcp", 
      auto_config: false,
      mac: "5CA1AB1E0001",
      virtualbox__intnet: true
  end

  config.vm.define "client2" do |c2|
    c2.vm.network "private_network",
      type: "dhcp",
      auto_config: false,
      mac: "5CA1AB1E0002",
      virtualbox__intnet: true
  end

  config.vm.define "server" do |sr|
    sr.vm.provision "shell", 
      path: "scripts/install-dhcp.sh",
      path: "scripts/provision-dhcp.sh" 
    sr.vm.network "private_network", type: "static", ip: "192.168.56.10"
    sr.vm.network "private_network", type: "static", ip: "192.168.57.10",
      virtualbox__intnet: "isolatednet"
  end
end
