# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER Matthieu NICOLAS <matthieu.nicolas@inria.fr>

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y -q git

RUN ["mkdir", "/app"]

WORKDIR /app

# CACHE_DATE is only used to stop caching instructions from this point
ARG CACHE_DATE="not a date"

RUN ["git", "clone", "--depth=1", "https://github.com/BuggleInc/PLM-nginx.git", "/app/PLM-nginx"]

# CONFIG allows to specify which configuration we want to retrieve
ARG CONFIG="tncy"
RUN ["sh", "-c",  "cp /app/PLM-nginx/$CONFIG/nginx.conf /etc/nginx/nginx.conf"]

RUN ["mkdir", "-p", "/etc/nginx/ssl"]

VOLUME /etc/nginx/ssl
