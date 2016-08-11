FROM debian:stable

MAINTAINER Carlo Eugster <carlo@relaun.ch>

COPY factorio.tar.gz /tmp/factorio.tar.gz

RUN  tar -xzf /tmp/factorio.tar.gz -C /opt \
  && rm -rf /tmp/factorio.tar.gz

ADD  init.sh /opt/factorio/

WORKDIR /opt/factorio
CMD ["./init.sh"]
