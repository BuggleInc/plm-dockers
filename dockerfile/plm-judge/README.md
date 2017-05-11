# Dockerfile for plm-judge

This Dockerfile could be used to build a docker image based on java:8 for [PLM-judge](https://github.com/BuggleInc/PLM-judge) application.

To build the PLM-judge docker image, you can use the provided script ```make.sh```.

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
docker run -e "MESSAGEQUEUE_ADDR=<URL of message queue service>"
           -e "MESSAGEQUEUE_PORT=<port of message queue service>"
           -d <name of your image>
```

The PLM-judge application should be running and waiting for an execution request through the message queue.

## More in details

When building the PLM-judge docker image, the JAR of PLM-judge is expected to be found inside the subdirectory ```target/```.

To get this JAR, you can either build the application using [Play Framework docker image](https://github.com/BuggleInc/plm-dockers/tree/update/dockerfile/play) or the command ```activator assembly``` if you setup the development environment.

In the later case, you can then build the plm-judge docker image with the following command (if needed, the PLM-judge jar file will copied in the ```target/``` directory):

```
./make.sh --bin /path/to/PLM-judge-jar
```
