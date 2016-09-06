FROM buggleinc/webplm:2.0.1
MAINTAINER Gerald Oster <oster@loria.fr>

VOLUME /app/webplm/newrelic

ENTRYPOINT ["bin/web-plm", "-Dhttps.port=9443", "-J-javaagent:newrelic/newrelic.jar"]
CMD []
