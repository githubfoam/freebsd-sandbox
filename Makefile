deploy-dragonflybsd-hammer:
	bash scripts/deploy-dragonflybsd-hammer.sh

deploy-dragonflybsd-generic:
	bash scripts/deploy-dragonflybsd-generic.sh

deploy-dragonflybsd:
	bash scripts/deploy-dragonflybsd.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

.PHONY: deploy-vagrant deploy-dragonflybsd
