# Dockerfile to build PLM-profiles application

This Dockerfile could be used to build a docker image based on node:6 for [PLM-profiles](https://github.com/BuggleInc/PLM-profiles) application.

# Usage

You can build this image using the following command:

```
docker build --build-arg REPOSITORY=<git repository to clone>
             --build-arg BRANCH=<name of the branch to checkout>
             -t <name of your image> .
```

Then to build your application, run:

```
docker run -p <port on the host>:8443
           --link <mongodb container name>:<mongodb container alias>
           -e 'DB_ADDR=<mongodb container alias>'
           -e 'SESSION_SECRET=<secret passphrase used for session encryption>'
           <name of your image>
```
