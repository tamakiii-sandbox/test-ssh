.PHONY: help setup daemon clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	$(HOME)/.ssh/id_rsa \
	$(HOME)/.ssh/authorized_keys

$(HOME)/.ssh/id_rsa:
	ssh-keygen -t rsa -b 2048 -f $@ -q -N ""

$(HOME)/.ssh/authorized_keys: | $(HOME)/.ssh/id_rsa.pub
	cp $| $@

$(HOME)/.ssh/id_rsa.pub: \
	$(HOME)/.ssh/id_rsa

daemon:
	/usr/sbin/sshd -D

clean:
	-rm -rf docker/ssh/.ssh/id_rsa
	# -rm -rf docker/ssh/.ssh/id_rsa.pub
	-rm -rf docker/ssh/.ssh/authorized_keys
