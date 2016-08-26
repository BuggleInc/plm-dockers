FROM debian:jessie
MAINTAINER Gerald Oster <oster@loria.fr>

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y -q apt-utils  curl ca-certificates git unzip

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update -qq && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN curl -O http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz && \
    tar xvfz scala-2.11.7.tgz -C / && \
    rm scala-2.11.7.tgz
ENV SCALA_HOME /scala-2.11.7
ENV PATH $PATH:$SCALA_HOME/bin

RUN curl -O http://downloads.typesafe.com/typesafe-activator/1.3.5/typesafe-activator-1.3.5-minimal.zip && \
    unzip typesafe-activator-1.3.5-minimal.zip -d / && \
    rm typesafe-activator-1.3.5-minimal.zip && \
    chmod a+x /activator-1.3.5-minimal/activator
ENV PATH $PATH:/activator-1.3.5-minimal

# Get sources
ARG REPOSITORY
ARG BRANCH=master

# CACHE_DATE is only used to stop caching instructions from this point
ARG CACHE_DATE="not a date"

RUN ["sh", "-c", "git clone --depth=1 --branch=$BRANCH https://$REPOSITORY /app"]

# Volume to cache dependencies
VOLUME /root/.ivy2

# Volume to share resulting binaries
RUN ["mkdir", "/app/target"]
VOLUME /app/target

WORKDIR /app

ENTRYPOINT ["activator"]
