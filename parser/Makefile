
tag_local_end = "-parser"
include ../config.mk
include ../common.mk

build:
	$(docker_build) --build-arg CODECOMPASS_IMAGE=$(codecompass_image) -t $(image_tag) .

