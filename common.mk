
.DEFAULT_GOAL = build

docker_run = docker run -it --rm
docker_build = docker build --build-arg DOCKER_ORGANIZATION=$(DOCKER_ORGANIZATION)

codecompass_image = codecompass-xenial-$(tag_suffix)
image_tag = $(DOCKER_ORGANIZATION)/codecompass-xenial-$(tag_suffix)$(tag_local_end)

push:
	docker push $(image_tag)

.PHONY: build push

