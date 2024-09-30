# -*- mode: ruby -*-
# vi: set ft=ruby :
# DHCP PROJECT

$script = <<-SCRIPT 
  apt-get update -y && apt-get upgrade -y
SCRIPT

$provider = "virtualbox"

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.provider $provider

  config.vm.provision "shell",
    inline: $script

  config.vm.define "client" do |cl|
    cl.vm.network "private_network", 
      auto_config: false,
      mac: "5CA1AB1E0001",
      virtualbox__intnet: true
  end

  config.vm.define "server" do |sr|
    sr.vm.provision "shell", inline: <<-SHELL
      apt-get install -y isc-dhcp-srever
    SHELL
    sr.vm.network "private_network", ip: "192.168.56.10"
  end
end
