# docker-compose for development

The goal of this *docker-compose* file is to provide the full **PLM** environment to test new **Docker** images of its components :
- [webPLM](https://github.com/BuggleInc/webPLM), the application server providing the user interface and the pedagogical content and managing the users' session
- [PLM-judge](https://github.com/buggleinc/plm-judge), the worker handling the user's code execution
- [RabbitMQ](https://www.rabbitmq.com/), a message queue allowing these two components to communicate
- [PLM-accounts](https://github.com/BuggleInc/PLM-accounts), our own authentication system and OAuth2 provider
- [PLM-profiles](https//github.com/BuggleInc/PLM-profiles), the service linking the user's identity to her git ID used by **PLM**
- [MongoDB](https://www.mongodb.com), the No-SQL database system

## Usage

You can easily deploy these containers with the following command:

```
docker-compose up
```

Several environment variables are used to configure these applications.
Some of them are already set inside the *docker-compose* configuration to ease the deployment.
However, to enjoy all functionalities provided by **PLM**, you will need to set the following:
* ```GITHUB_ACCESS_TOKEN```
* ```PLM_OAUTH_REDIRECT_URL```
* ```PLM_FACEBOOK_OAUTH_REDIRECT_URL```
* ```GITHUB_CLIENT_ID```
* ```GITHUB_CLIENT_SECRET```
* ```PLMACCOUNTS_CLIENT_ID```
* ```PLMACCOUNTS_CLIENT_SECRET```
* ```SESSION_SECRET```
* ```MAILER_FROM```
* ```MAILER_SERVICE_PROVIDER```
* ```MAILER_EMAIL_ID```
* ```MAILER_PASSWORD```
