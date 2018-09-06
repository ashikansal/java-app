# NGINX image with build artifact

FROM nginx:latest

MAINTAINER Ashi Kansal

ENV STATIC_CONTENT static

#ENV REFRESHED_AT 2015-09-20
#ENV GITHUB_REPO https://github.com/garystafford/spring-music/raw/build-artifacts
#ENV STATIC_FILE spring-music-static.zip

RUN apt-get update -y && \
  apt-get install unzip curl -y

#Add certificate and keys for https support

COPY ssl/*.key /etc/ssl/private/
COPY ssl/*.crt /etc/ssl/certs/

#Add static assets to container
ADD ${STATIC_CONTENT}.zip /tmp/

RUN unzip /tmp/${STATIC_CONTENT}.zip -d /tmp/ && \
  mkdir -p /usr/share/nginx/assets && \
  mv /tmp/${STATIC_CONTENT}/* /usr/share/nginx/assets

COPY default.conf /etc/nginx/conf.d/default.conf
