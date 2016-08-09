# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER Matthieu NICOLAS <matthieu.nicolas@inria.fr>

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y -q git

RUN ["mkdir", "/app"]

WORKDIR /app

RUN ["git", "clone", "--depth=1", "https://github.com/BuggleInc/PLM-nginx.git", "/app/PLM-nginx"]

RUN ["cp", "/app/PLM-nginx/nginx.conf", "/etc/nginx/nginx.conf"]

RUN ["mkdir", "-p", "/etc/nginx/ssl"]

VOLUME /etc/nginx/ssl
