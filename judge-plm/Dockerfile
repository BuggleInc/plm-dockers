FROM java:8
MAINTAINER Gerald Oster <oster@loria.fr>

RUN ["mkdir", "-p", "/app/judge"]

COPY ["/target/PLM-judge-assembly-1.0-SNAPSHOT.jar", "/app/judge/PLM-judge.jar"]

WORKDIR /app/judge
CMD ["java", "-jar", "PLM-judge.jar"]
