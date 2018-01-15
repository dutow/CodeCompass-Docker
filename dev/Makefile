
include ../config.mk

.PHONY: build push

build:
	docker build --build-arg DOCKER_ORGANIZATION=$(DOCKER_ORGANIZATION) -t $(DOCKER_ORGANIZATION)/codecompass-xenial-dev .

push:
	docker push $(DOCKER_ORGANIZATION)/codecompass-xenial-base
