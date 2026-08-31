FROM eclipse-temurin:25-jdk-alpine@sha256:09349d79941fd53bb3d487b393ca118d8853c08c09193f416fe6a8718df9e732 AS build
WORKDIR /workspace

# Laster inn minimalt av filer for å få caching av gradle inn.
COPY gradlew gradlew.bat settings.gradle.kts gradle.properties ./
COPY gradle ./gradle
RUN ./gradlew --version
COPY . .

RUN --mount=type=secret,id=github_user,env=GITHUB_USER \
    --mount=type=secret,id=kv_packages_pat,env=KV_PACKAGES_PAT \
    ./gradlew copyGeoserverLibs

RUN ./gradlew copyLoggingLibs

FROM docker.osgeo.org/geoserver:3.1.x@sha256:2b7e9f1e834f237d4ea36eb5ba56e3ec7b3af8baccac5889c127316178f33987

# Logger Tomcat-advarsler og -feil som JSON til stdout.
COPY app/src/main/resources/tomcat/logging.properties /usr/local/tomcat/conf/logging.properties

# Kopierer inn datamappe til vanlig plassering for GEOSERVER_DATA_DIR
COPY --from=build /workspace/app/src/main/resources/data /opt/geoserver_data

# Kopierer inn oracle extension og matrikkel-geotools-jdbc pakker direkte
COPY --from=build /workspace/app/build/geoserver/ /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/

COPY --from=build /workspace/app/build/logging/ /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/

# Sletter vanlig geotools som er erstattet med matrikkel versjon
RUN rm -f /usr/local/tomcat/webapps/geoserver/WEB-INF/lib/gt-jdbc-[0-9]*.jar

# Triksing for å håndtere readonly på skip, kopierer en del filer inn i tmp ved oppstart
ENV CATALINA_HOME="/tmp/tomcat"
ENV GEOSERVER_DATA_DIR="/tmp/geoserver_data"
ENV GEOSERVER_CONSOLE_DISABLED="true"
COPY --from=build /workspace/app/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
