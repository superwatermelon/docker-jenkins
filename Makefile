IMAGE_NAME := superwatermelon/jenkins
tag := $(if $(TAG),$(TAG),test)

image:
	docker build --tag $(IMAGE_NAME):$(tag) .

test:
	IMAGE=$(IMAGE_NAME):$(tag) bats test/suite.bats

release:
	docker build --tag $(IMAGE_NAME):$(tag) .

.PHONY: image test release
