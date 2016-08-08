# docker-compose for the main-server

The goal of this *docker-compose* file is to deploy several components for setting up the main server of [webPLM](https://github.com/BuggleInc/webPLM) using **Docker**

## Usage

First, you will have to set several environment variables on your host machine:
- ```GITHUB_ACCESS_TOKEN```: Your access token for **GitHub**, necessary if you want to push the local git repositories to **GitHub**
- ```PLM_OAUTH_REDIRECT_URL```: The URL where the user will be redirected after signing in via another service
- ```PLM_FACEBOOK_OAUTH_REDIRECT_URL```: The URL where the user will be redirected after signing in via **Facebook**
- ```PLM_PLMACCOUNTS_OAUTH_REDIRECT_URL```: The URL where the user will be redirected after signing in via **PLM-accounts**
- ```GITHUB_CLIENT_ID```: Your **GitHub** application's id for OAuth
- ```GITHUB_CLIENT_SECRET```: Your **GitHub** application's secret for OAuth
- ```PLMACCOUNTS_CLIENT_ID```: Your **PLM-accounts** application's id for OAuth
- ```PLMACCOUNTS_CLIENT_SECRET```: Your **PLM-accounts** application's secret for OAuth

Also several volumes are mounted to the containers and have to be setup:
- *~/webPLM/ssl* : This volume will be mounted to the [PLM-nginx](https://github.com/BuggleInc/PLM-nginx) container, please refer to the [documentation of its **Docker** image](https://github.com/BuggleInc/plm-dockers/tree/update/dockerfile/nginx)
- *~/webPLM/newrelic* : This volume will be mounted to the [webPLM](https://github.com/BuggleInc/webPLM) container, please refer to the [documentation of its **Docker** image](https://github.com/BuggleInc/plm-dockers/tree/update/dockerfile/web-plm-newrelic)

Then, deploy all the components with the following command:

```
docker-compose up
```

Finally, if you want to start more judges, use this command:

```
docker-compose scale judge=<number of judges wanted>
```
