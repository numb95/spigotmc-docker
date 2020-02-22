FROM openjdk:8-jdk-buster as builder
WORKDIR /build
ADD https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar /build/BuildTools.jar
# RUN git status
RUN java -Xmx4G -Djavax.net.ssl.trustStorePassword=changeit -jar BuildTools.jar
RUN ls 
RUN mv spigot-*.jar  spigot.jar

FROM openjdk:8-jdk-alpine3.9
WORKDIR /app
COPY --from=builder /build/spigot.jar .
WORKDIR /game
CMD ["java","-Xms1G", "-Xmx1G", "-XX:+UseConcMarkSweepGC", "-jar", "/app/spigot.jar"]