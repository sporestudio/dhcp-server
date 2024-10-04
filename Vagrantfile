# -*- mode: ruby -*-
# vi: set ft=ruby :
# DHCP PROJECT - 1 server and 2 clients
# Jorge Rodriguez Castillo


Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  config.vm.provider :virtualbox do |vb|
        vb.memory = 256
        vb.cpus = 1
  end

  config.vm.define "client1" do |c1|
    c1.vm.hostname = "client1"
    c1.vm.network "private_network",
      type: "dhcp", 
      mac: "5CA1AB1E0001",
      virtualbox__intnet: true

    c1.vm.provision "shell",
      path: "scripts/setup.sh",
      args: ["client1"]
  end

  config.vm.define "client2" do |c2|
    c2.vm.hostname = "client2"
    c2.vm.network "private_network",
      type: "dhcp",
      mac: "5CA1AB1E0002",
      virtualbox__intnet: true

    c2.vm.provision "shell",
      path: "scripts/setup.sh",
      args: ["client2"]
  end

  config.vm.define "server" do |sr|
    sr.vm.network "private_network", type: "static", ip: "192.168.56.10"
    sr.vm.network "private_network", type: "static", ip: "192.168.57.10",
      virtualbox__intnet: true

    sr.vm.provision "shell",
      path: "scripts/setup.sh",
      args: ["server"]
  end
end
