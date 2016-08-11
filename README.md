[![](https://badge.imagelayers.io/teamunpro/factorio:latest.svg)](https://imagelayers.io/?images=teamunpro/factorio:latest 'Get your own badge on imagelayers.io')

# Introduction

Dockerfile to build a [Factorio](https://www.factorio.com) game server image. You can find the pre-built images on Docker Hub at [teamunpro/docker-factorio](https://hub.docker.com/r/teamunpro/docker-factorio/)

# Basic Usage

The init script will automatically create a new save game if none exists. 

```bash
docker run -d \
           -p 34197:34197/udp \
           --name factorio-server \
           teamunpro/docker-factorio 
```

# Persisting Saves

Use a docker volume to persist the savegames on the host machine rather than in the docker container.

```bash
docker run -d \
           -v $(pwd)/saves:/opt/factorio/saves \
           -p 34197:34197/udp \
           --restart=always \
           --name factorio-server \
           teamunpro/docker-factorio 
```

# Build Your Own

The latest Factorio headless server is downloaded at build time. This may be a good reason you want to build your own image since the Docker Hub repo may not always be up to date.

```bash
git clone https://github.com/teamunpro/docker-factorio.git
docker build -t some-factorio .
```

Then launch your container as usual.

```bash
docker run -d \
           -v $(pwd)/saves:/opt/factorio/saves \
           -p 34197:34197/udp \
           --restart=always \
           --name factorio-server \
           some-factorio 
```
