FROM debian:latest
MAINTAINER Hongan Li <hongli@redhat.com>
# install binary and remove cache
RUN apt-get update \
    && apt-get install -y net-tools tcpdump iperf smcroute \
    && rm -rf /var/lib/apt/lists/*
CMD ["mv", "/usr/sbin/smcroute", "/usr/local/bin/smcroute"]
COPY omping /usr/bin/omping
COPY myscript.sh /usr/local/bin/myscript.sh
CMD ["/usr/local/bin/myscript.sh"]
