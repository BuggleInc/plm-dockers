# Dockerfile for web-plm

This Dockerfile could be used to build a docker image based on debian:jessie for [webPLM](https://github.com/BuggleInc/webPLM) application.

To build the web-plm docker image, you can use the available script ```make.sh```.

```
./make.sh [-h | --help]
          [-c | --clean]
          [--no-cache]
          [-r | --repository <repository name>]
          [-b | --branch <branch name>]
          [-n | --name <docker image name>]
          [-v | --version <docker image version>]
```

Then, you can use the following command line to run the container:
```
docker run -d -p 8080:9000 <name of your image>
````

The PLM web application should be available from your docker host at the port 8080.

## More in details

When building the web-plm docker image, the binaries of web-plm are expected to be found inside the subdirectory ```target/```.

To get these binaries, you can either build the application using [Play Framework docker image](https://github.com/BuggleInc/plm-dockers/tree/update/play) or the command ```activator stage``` if you setup the development environment.

Then you can use the following command line to build the docker image:
```
docker build -t <name of your image> github.com/BuggleInc/plm-dockers.git#update:web-plm
```
