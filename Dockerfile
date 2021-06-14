FROM debian:10.9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ssh \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*