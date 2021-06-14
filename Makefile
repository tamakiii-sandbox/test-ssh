.PHONY: help setup bash clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	build

build:
	docker-compose build

bash:
	docker-compose run --rm ssh $@

clean:
	docker-compose down -v
