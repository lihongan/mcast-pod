FROM debian:latest
MAINTAINER Hongan Li <hongli@redhat.com>
# install binary and remove cache
RUN apt-get update \
    && apt-get install -y net-tools tcpdump iperf \
    && rm -rf /var/lib/apt/lists/*
COPY omping /usr/bin/omping
COPY myscript.sh /usr/local/bin/myscript.sh
CMD ["/usr/local/bin/myscript.sh"]
