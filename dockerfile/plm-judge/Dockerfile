FROM java:8
MAINTAINER Gerald Oster <oster@loria.fr>

RUN ["mkdir", "-p", "/app/judge"]

ARG VERSION
COPY ["/target/PLM-judge-assembly-$VERSION.jar", "/app/judge/PLM-judge.jar"]

WORKDIR /app/judge
CMD ["java", "-jar", "PLM-judge.jar"]
