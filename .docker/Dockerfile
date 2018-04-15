FROM node:latest

MAINTAINER Boudfor saad

USER root

WORKDIR /src

RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

EXPOSE 4200

RUN apt-get update && npm install -g npm@4.3.0 -unsafe-perm && npm install -g @angular/cli -unsafe-perm

ADD scripts /usr/local/scripts

VOLUME /src

