# Dockerfile for web-plm

This Dockerfile could be used to build a docker image based on debian:jessie for web-plm application.
The web-plm application is built from the official github repository.

You can use the following command line to build the docker image:
```
docker build --tag=buggleinc/webplm github.com/BuggleInc/plm-dockers.git#:web-plm
```

Then, you can use the following command line to run the container:
```
docker run -d -p 8080:9000 buggleinc/webplm
````

The PLM web application should be available from your docker host at the port 8080.

