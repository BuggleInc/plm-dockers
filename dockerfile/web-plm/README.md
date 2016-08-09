# Dockerfile for webplm

This Dockerfile could be used to build a docker image based on debian:jessie for [webPLM](https://github.com/BuggleInc/webPLM) application.

To build the webPLM docker image, you can use the available script ```make.sh```.

```
./make.sh [-h | --help]
          [-c | --clean]
          [--no-cache]
          [-r | --repository <repository name>]
          [-b | --branch <branch name>]
          [--bin <path to binaries>]
          [-n | --name <docker image name>]
          [-v | --version <docker image version>]
```

Then, you can use the following command line to run the container:
```
docker run -p 80:9000
           -p 443:9443
           <name of your image>
```

The PLM web application should be available from your docker host using either HTTP or HTTPS.

## More in details

When building the webPLM docker image, the binaries of webPLM are expected to be found inside the subdirectory ```target/```.

To get these binaries, you can either build the application using [Play Framework docker image](https://github.com/BuggleInc/plm-dockers/tree/update/dockerfile/play) or the command ```activator stage``` if you setup the development environment.

In the later case, you can then build the webPLM docker image with this command:

```
./make.sh --bin /path/to/binaries
```
