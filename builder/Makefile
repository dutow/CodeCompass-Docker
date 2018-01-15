
# Disable parallel builds because we are sharing some subdirectories (codecompass and build)
.NOPARALLEL:

include ../config.mk
include ../common.mk

builder_tag = $(DOCKER_ORGANIZATION)/codecompass-xenial-dev


current_dir = $(shell pwd)
builder_volumes = -v$(current_dir)/../src:/work/codecompass-src -v$(current_dir)/build:/work/codecompass-build -v$(current_dir)/codecompass:/codecompass

image_tag = $(DOCKER_ORGANIZATION)/codecompass-xenial-$(tag_suffix)

build:
	rm -rf codecompass
	rm -rf build
	mkdir codecompass
	mkdir build
	$(docker_run) $(builder_volumes) $(builder_tag) sh -c "cd /work/codecompass-build && cmake ../codecompass-src -DDATABASE=$(codecompass_database) -DCMAKE_BUILD_TYPE=$(codecompass_build_variant) -DCMAKE_INSTALL_PREFIX=/codecompass"
	$(docker_run) $(builder_volumes) $(builder_tag) sh -c "cd /work/codecompass-build && make install -j"
	$(docker_build) -t $(image_tag) .

push:
	docker push $(image_tag)

.PHONY: build push
