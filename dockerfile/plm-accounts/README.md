# Dockerfile to build PLM-accounts application

This Dockerfile could be used to build a docker image based on node:6 for [PLM-accounts](https://github.com/BuggleInc/PLM-accounts) application.

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
           -e 'MAILER_FROM=<"Sender Name" <sender@server.com>'
           -e 'MAILER_SERVICE_PROVIDER=<mail provider>'
           -e 'MAILER_EMAIL_ID=<email ID>'
           -e 'MAILER_PASSWORD=<email password>'
           <name of your image>
```

As you can see, several environment variables need to be set for the application to work correctly.
Don't forget to set them.
