FROM phusion/baseimage:0.11
MAINTAINER github.com/soundscapecloud/soundscape


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y iproute2 iptables dnsmasq socat

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

COPY subspace-linux-amd64 /usr/bin/subspace
RUN chmod +x /usr/bin/subspace /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

CMD [ "/sbin/my_init" ]
