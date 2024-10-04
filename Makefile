# DHCP-SERVER


## Main task
all: up provison

up:
	@echo "Deploying the vagrant machine..."
	vagrant up

provison:
	@echo "Provisioning virtual machines.."
	vagrant provision
