VERSION = $(shell wget -q -O - "https://www.factorio.com/download-headless/stable" | grep -o -m1 "/get-download/.*/headless/linux64" | sed -nEe "s\#/get-download/([^/]+).+\#\1\#p")

all:
	wget -q --no-check-certificate "https://www.factorio.com/get-download/${VERSION}/headless/linux64" -O factorio.tar.gz
	docker build -t "tronpaul/factorio:${VERSION}" -t tronpaul/factorio:latest .
