FROM node:latest

RUN apt-get update

MAINTAINER Boudfor saad

USER root

WORKDIR /src

RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

EXPOSE 4200

RUN npm install -g npm@4.3.0 -unsafe-perm
RUN npm install -g @angular/cli

VOLUME /src

ADD  $WORKDIR ./root


