FROM webplm:2.0-rc2
MAINTAINER Gerald Oster <oster@loria.fr>

VOLUME /app/webplm/newrelic

CMD ["bin/web-plm", "-Dhttps.port=9443", "-J-Xmx8192m", "-J-Xms2048m", "-J-javaagent:newrelic/newrelic.jar"]
