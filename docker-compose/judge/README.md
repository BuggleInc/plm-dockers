# docker-compose for judges

The goal of this *docker-compose* file is to deploy easily new instances of [PLM-judge](https://github.com/buggleinc/plm-judge) using **Docker**.

## Usage

First, you will have to set several environment variables on your host machine:
- ```MESSAGEQUEUE_ADDR```: the URL to your message queue
  - Example: ```localhost```
- ```MESSAGEQUEUE_PORT```: the port to connect to your message queue
  - Example: ```5672```

Then, deploy a judge with the following command:

```
docker-compose up
```

Finally, if you want to start more judges, use this command:

```
docker-compose scale judge=<number of judges wanted>
```
