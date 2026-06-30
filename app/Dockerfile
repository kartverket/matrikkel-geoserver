FROM eclipse-temurin:25-jdk-alpine@sha256:30d9f87d702c2c1c601ed0d31e0c88ea1ea474ee7676cda7b7a59e759181c4dd AS build
WORKDIR /workspace

# Laster inn minimalt av filer for å få caching av gradle inn.
COPY gradlew gradlew.bat settings.gradle.kts gradle.properties ./
COPY gradle ./gradle
RUN ./gradlew --version
COPY . .

RUN ./gradlew copyGeoserverLibs
RUN ./gradlew copyLoggingLibs

FROM docker.osgeo.org/geoserver:3.0.0@sha256:d8ff66a3e0f956415e048494a876e03f6475ddabcf1b1e6e9a8adba82ca50ee7
# Kopierer inn datamappe til tmp plassering for GEOSERVER_DATA_DIR
ENV GEOSERVER_DATA_DIR="/tmp/geoserver_data"
COPY --from=build /workspace/app/src/main/resources/data $GEOSERVER_DATA_DIR

# Kopierer inn oracle extension pakker direkte
COPY --from=build /workspace/app/build/geoserver/ /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/

COPY --from=build /workspace/app/build/logging/ /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/

