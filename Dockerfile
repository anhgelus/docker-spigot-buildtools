FROM openjdk:17-bullseye

WORKDIR /app
COPY ./is-version-valid.sh ./is-version-valid.sh

ENV VERSION latest

RUN apt update && \
    apt install -y git curl && \
    curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

#RUN sh ./is-version-valid.sh 17 ${VERSION}

CMD java -jar BuildTools.jar --rev ${VERSION}
