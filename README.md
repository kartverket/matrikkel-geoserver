# matrikkel-geoserver

This project uses [Gradle](https://gradle.org/) to download the GeoServer extension libraries that are copied into the Docker image.
Run Gradle directly from the terminal:

* Run `./gradlew copyGeoserverLibs copyLoggingLibs` to download the libraries used by the GeoServer image.
* Run `./gradlew build` to run the Gradle lifecycle build.
* Run `./gradlew clean` to clean all build outputs.

Note the usage of the Gradle Wrapper (`./gradlew`).
This is the suggested way to use Gradle in production projects.

[Learn more about the Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html).

[Learn more about Gradle tasks](https://docs.gradle.org/current/userguide/command_line_interface.html#common_tasks).

This project uses a version catalog (see `gradle/libs.versions.toml`) to declare and version dependencies
and both a build cache and a configuration cache (see `gradle.properties`).

# Geoserver

This project includes a docker compose that starts the geoserver image

`docker compose up --build`

### Database

This project expects a preconfigured database. 
Copy .env.template to .env and fill inn the environment variables. 

GeoServer will start without the correct database information, but you will not be able to use the services.

### Keycloak
This project also expects a preconfigured keycloak instance. If the keycloak client is not setup correctly, follow these [steps](./auth-proxy/README.md#)