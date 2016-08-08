# docker-compose for development

The goal of this *docker-compose* file is to provide an environment to test new **Docker** images of the main components of :
- [webPLM](https://github.com/BuggleInc/webPLM), the application server providing the user interface and the pedagogical content and managing the users' session
- [PLM-judge](https://github.com/buggleinc/plm-judge), the worker handling the user's code execution
- [RabbitMQ](https://www.rabbitmq.com/), a message queue allowing these two components to communicate

## Usage

You can easily deploy these containers with the following command:

```
docker-compose up
```

If you want to be able to push the changes of local git repositories to **GitHub**, you will have to set the following environment variable with your access token: ```GITHUB_ACCESS_TOKEN```
