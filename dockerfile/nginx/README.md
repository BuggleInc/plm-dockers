# Dockerfile for NGINX

This Dockerfile could be used to build a custom NGINX docker image.
The NGINX configuration used is available [here](https://github.com/BuggleInc/PLM-nginx).

To build the custom NGINX docker image, use the following command:

```
docker build -t <name of your image> .
```

Then, you can use the following command line to run the container:
```
docker run -p 80:80
           -p 443:443
           -v path/to/ssl/certificates:/etc/nginx/ssl
           -d <name of your image>
````

The volume should contain two SSL certificates and the corresponding keys:
- *webPLM.crt* and *webPLM.key*
- *plm-accounts.crt* and *plm-accounts.key*
