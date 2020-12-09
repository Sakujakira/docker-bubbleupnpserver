FROM debian:latest

#install gnupg since its necessary in the next step
RUN apt-get -y update && \
        apt-get upgrade -y && \
        apt-get -y install gnupg
#install dependencies and bubbleupnpserver
RUN apt-get install -y --no-install-recommends \
        default-jre \
        software-properties-common \
        curl \
        net-tools \
        iptables && \
        echo "deb http://ppa.launchpad.net/bubbleguuum/bubbleupnpserver/ubuntu focal main" > /etc/apt/sources.list.d/bubbleupnp.list && \
        apt-key adv --keyserver hkps://keyserver.ubuntu.com --recv-keys 0x0555473C13370C96D48168944B5FE5DA1C4E3F4D && \
        apt-get -y  update && \
        apt-get install -y bubbleupnpserver ffmpeg libavcodec-extra &&\
        mkdir /config &&\
        apt-get clean

EXPOSE 58050/tcp 58051/tcp 1900/udp
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:58050 || exit 1

VOLUME /config
ENTRYPOINT [ "/usr/share/bubbleupnpserver/launch.sh", "-dataDir", " /config" ]

