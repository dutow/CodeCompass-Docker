
.DEFAULT_GOAL := build

build-base:
	$(MAKE) -C base build
	$(MAKE) -C dev build

push-base:
	$(MAKE) -C base push
	$(MAKE) -C dev push

build-debug: build-base
	$(MAKE) do_part do_action=build codecompass_build_variant=Debug codecompass_database=pgsql tag_suffix="pgsql-debug"

build-release: build-base
	$(MAKE) do_part do_action=build codecompass_build_variant=Release codecompass_database=pgsql tag_suffix="pgsql"

push-debug:
	$(MAKE) do_part do_action=push codecompass_build_variant=Debug codecompass_database=pgsql tag_suffix="pgsql-debug"

push-release:
	$(MAKE) do_part do_action=push codecompass_build_variant=Release codecompass_database=pgsql tag_suffix="pgsql"

build: build-base build-debug build-release

push: build push-base push-debug push-release


do_part:
	$(MAKE) -C builder $(do_action)
	$(MAKE) -C parser $(do_action)
	$(MAKE) -C server $(do_action) codecompass_build_variant=$(codecompass_build_variant) codecompass_database=$(codecompass_database) tag_suffix=$(tag_suffix)
