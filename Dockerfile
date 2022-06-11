#sudo docker build --no-cache --build-arg CLOUDFLARED_VERSION=<version> --build-arg DOMAIN=<domain> -t localhost:5000/cloudflaredian:<version> .
FROM ubuntu

ARG CLOUDFLARED_VERSION
ARG DOMAIN
 

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install wget -y

RUN wget https://github.com/cloudflare/cloudflared/releases/download/${CLOUDFLARED_VERSION}/cloudflared-linux-amd64.deb

RUN dpkg -i cloudflared-linux-amd64.deb

#RUN cloudflared tunnel login

RUN echo "cloudflared tunnel run ${DOMAIN}" > /root/startTunnel.sh

RUN chmod +x /root/startTunnel.sh
