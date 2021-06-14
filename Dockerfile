FROM debian:10.9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      openssh-server \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd

CMD ["/usr/sbin/sshd", "-D"]
