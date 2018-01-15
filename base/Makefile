
include ../config.mk

build: 
	docker build -t $(DOCKER_ORGANIZATION)/codecompass-xenial-base .

push: 
	docker push $(DOCKER_ORGANIZATION)/codecompass-xenial-base
