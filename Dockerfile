FROM debian:latest
MAINTAINER Hongan Li <hongli@redhat.com>
# install binary and remove cache
RUN apt-get update \
    && apt-get install -y sudo net-tools tcpdump iperf smcroute \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -m test && adduser test sudo && echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY omping /usr/bin/omping
USER test
CMD ["sudo", "smcroute", "-n", "-d"]
