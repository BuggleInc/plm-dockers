# Dockerfile for plm-nginx

This Dockerfile could be used to build a custom NGINX docker image.
The NGINX configuration used is available [here](https://github.com/BuggleInc/PLM-nginx).

To build the custom NGINX docker image, use the following command:

```
docker build --build-arg CACHE_DATE=$(date +%Y-%m-%d:%H:%M:%S)
             --build-arg CONFIG=tncy
             -t <name of your image> .
```

Then, you can use the following command line to run the container:
```
docker run -p 80:80
           -p 443:443
           -v path/to/ssl/certificates:/etc/nginx/ssl
           -d <name of your image>
```

The volume should contain the SSL certificates and the corresponding keys required by the configuration used.
