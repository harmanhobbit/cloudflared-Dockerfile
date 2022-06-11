# Cloudflaredian

This Dockerfile creates the image for the Cloudflaredian container.

## Building
```
sudo docker build --no-cache --build-arg CLOUDFLARED_VERSION=<version> --build-arg DOMAIN=<domain> -t cloudflaredian:<version> .
```

## Running
Here is an example docker-compose.yml
```
version: '3'

services:
  cloudflared_tunnel1:
    image: cloudflaredian:<version>
    entrypoint: '/bin/sh'
    command: '/root/startTunnel.sh'
    volumes:
      - /srv/Config/Cloudflared/data:/root/.cloudflared
    restart: always
    labels:
      - com.centurylinklabs.watchtower.enable=false
```
