FROM node:6

# Install gem sass for  grunt-contrib-sass
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y ruby
RUN gem install sass

# Install Mean.JS Prerequisites
RUN npm install -g grunt-cli
RUN npm install -g bower

RUN useradd -ms /bin/bash mean

USER mean

# Get sources
ARG REPOSITORY=https://github.com/BuggleInc/PLM-profiles.git
ARG BRANCH=master

RUN ["sh", "-c", "git clone --depth=1 --branch=$BRANCH $REPOSITORY /home/mean/plm-profiles"]

WORKDIR /home/mean/plm-profiles

RUN npm install

RUN bower install

# Port 8443 for server
EXPOSE 8443

# Set production environment
ENV NODE_ENV production

CMD ["grunt", "prod"]
