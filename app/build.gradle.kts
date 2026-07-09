plugins {
    // Apply the shared build logic from a convention plugin.
    // The shared code is located in `buildSrc/src/main/kotlin/kotlin-jvm.gradle.kts`.
    id("buildsrc.convention.kotlin-jvm")

    // Apply the Application plugin to add support for building an executable JVM application.
    application
}

configurations {
    register("geoserver"){
        isTransitive = false
    }

    register("logging")
}

dependencies {
    // Project "app" depends on project "utils". (Project paths are separated with ":", so ":utils" refers to the top-level "utils" project.)
    implementation(project(":utils"))
    "geoserver"(libs.gt.jdbc)
    "geoserver"(libs.ojdbc17)
    "geoserver"(libs.matrikkel.geotools.jdbc)

    "logging"(libs.log4j.layout)
}

application {
    // Define the Fully Qualified Name for the application main class
    // (Note that Kotlin compiles `App.kt` to a class with FQN `com.example.app.AppKt`.)
    mainClass = "no.kartverket.matrikkel.app.AppKt"
}
tasks.register<Copy>("copyGeoserverLibs") {
    from(configurations["geoserver"])
    into(layout.buildDirectory.dir("geoserver"))
}
tasks.register<Copy>("copyLoggingLibs") {
    from(configurations["logging"])
    into(layout.buildDirectory.dir("logging"))
}
