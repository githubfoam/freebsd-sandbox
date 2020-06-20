IMAGE := alpine/fio
APP:="scripts/deploy-vagrant.sh"

deploy-vagrant:
	bash scripts/deploy-vagrant.sh
push-image:
	docker push $(IMAGE)
.PHONY: deploy-vagrant push-image
