.PHONY: help setup info bash ssh inspect clean

IP_ADDRESS ?= $(shell docker inspect $(shell docker-compose ps -q ssh) | jq -r '.[].NetworkSettings.Networks["test-ssh_default"].IPAddress')

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	build

info:
	@echo "IP_ADDRESS=$(IP_ADDRESS)"

build:
	docker-compose build

bash:
	docker-compose run --rm ssh $@

ssh1:
	docker-compose exec ssh ssh -p 2222 root@localhost

ssh2:
	ssh -i sync/root/.ssh/id_rsa -p 2222 root@localhost

inspect:
	docker inspect $(shell docker-compose ps -q ssh)

clean:
	docker-compose down -v
	-rm -rf ./sync
