IMAGE := alpine/fio
APP:="scripts/usernetes-containerd.sh"

deploy-boxes:
	bash scripts/deploy-boxes.sh
deploy-libvirt:
	bash scripts/deploy-libvirt.sh
deploy-vagrant:
	bash scripts/deploy-vagrant.sh
push-image:
	docker push $(IMAGE)
.PHONY: usernetes-containerd usernetes-crio push-image
