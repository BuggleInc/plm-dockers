FROM buggleinc/webplm:2.0.0-rc6
MAINTAINER Gerald Oster <oster@loria.fr>

VOLUME /app/webplm/newrelic

ENTRYPOINT ["bin/web-plm", "-Dhttps.port=9443", "-J-javaagent:newrelic/newrelic.jar"]
CMD []
