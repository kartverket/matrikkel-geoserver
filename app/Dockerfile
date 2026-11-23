FROM dhi.io/eclipse-temurin:27.0.1.4-jdk-alpine-dev@sha256:1f1994de6e3c5f2c6e5f61562781f07ecc1eeb0f33b0b3d04c7890db72a105ef AS build
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

FROM docker.osgeo.org/geoserver:3.0.1@sha256:7cb827ba3f6d9fc04a6647fc0cfa6c254fc642407f0d99281fdf026d2540b558

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
