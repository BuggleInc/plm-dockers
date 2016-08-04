FROM buggleinc/plm-judge:2.0-rc2
MAINTAINER Gerald Oster <oster@loria.fr>

VOLUME /app/judge/newrelic

CMD ["java", "-jar", "-javaagent:newrelic/newrelic.jar", "PLM-judge.jar"]
