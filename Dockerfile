FROM debian:stable

MAINTAINER Mark McGuire <mark.b.mcg@gmail.com>

COPY factorio.tar.gz /tmp/factorio.tar.gz

RUN  tar -xzf /tmp/factorio.tar.gz -C /opt \
  && rm -rf /tmp/factorio.tar.gz

ADD  init.sh /opt/factorio/

WORKDIR /opt/factorio
EXPOSE 34197/udp
CMD ["./init.sh"]
