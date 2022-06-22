FROM openjdk:8-bullseye

WORKDIR /app
COPY ./is-version-valid.sh .
COPY ./build.sh .

RUN apt update && \
    apt install -y git curl && \
    curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

ENV VERSION latest

#RUN sh ./is-version-valid.sh 8 ${VERSION}

CMD sh build.sh ${VERSION}
