# Postgresql docker HA cluster

This project is a ready to deploy stack for postgresql HA cluster managed with
portainer.

## Build images

Pre-built images are hosted on a private registry, ajust `REG` variable in
Makefile to point to your own registry, then ajust `docker-compose.yml` images
according to your registry.

In order to build those images you need to clone
[PostDoc](https://github.com/paunin/PostDock) at the same level of this
repository.

Then just use `make` command to build images and push them to your registry.

## Usage

You need to first create an overlay network named `pgsql_ha_9-6` using
portainer UI or run the following command inside a swarm manager node:

```
docker network create --scope "swarm" --driver overlay pgsql_ha_9-6
```

Then use portainer UI to deploy this stack by cloning this repository.
