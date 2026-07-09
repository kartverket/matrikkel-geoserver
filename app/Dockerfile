FROM eclipse-temurin:25-jdk-alpine@sha256:30d9f87d702c2c1c601ed0d31e0c88ea1ea474ee7676cda7b7a59e759181c4dd AS build
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

FROM docker.osgeo.org/geoserver:3.0.0@sha256:d8ff66a3e0f956415e048494a876e03f6475ddabcf1b1e6e9a8adba82ca50ee7

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
COPY --from=build /workspace/app/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

