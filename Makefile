IMAGE_NAME = superwatermelon/jenkins
TAG = test

image:
	docker build --tag $(IMAGE_NAME):$(TAG) .

test:
	IMAGE=$(IMAGE_NAME):$(TAG) bats test/suite.bats

release:
	docker tag $(IMAGE_NAME):$(TAG) $(IMAGE_NAME):latest
	scripts/docker-login
	docker push $(IMAGE_NAME):$(TAG)
	docker push $(IMAGE_NAME):latest

.PHONY: image test release
