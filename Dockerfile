FROM debian:10.9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      openssh-server \
      make \
      less \
      man \
      man-db \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd

CMD ["make", "setup", "daemon"]
