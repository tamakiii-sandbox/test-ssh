.PHONY: help setup daemon ssh clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	~/.ssh/id_rsa \
	~/.ssh/authorized_keys

~/.ssh/id_rsa:
	ssh-keygen -t rsa -b 2048 -f $@ -q -N ""

~/.ssh/authorized_keys: | ~/.ssh/id_rsa.pub
	cp $| $@

~/.ssh/id_rsa.pub: \
	~/.ssh/id_rsa

daemon:
	/usr/sbin/sshd -D

ssh: | ./sync/root/.ssh/id_rsa
	ssh -i $| -p 2222 root@localhost

clean:
	# -rm ~/.ssh/id_rsa
	# -rm ~/.ssh/authorized_keys
