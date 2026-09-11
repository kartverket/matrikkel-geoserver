plugins {
    base
}

configurations {
    register("geoserver"){
        isTransitive = false
    }

    register("logging") {
        isTransitive = false
    }
}

dependencies {
    "geoserver"(libs.gt.jdbc)
    "geoserver"(libs.ojdbc17)
    "geoserver"(libs.matrikkel.geotools.jdbc)

    "logging"(libs.log4j.layout)
}

tasks.register<Copy>("copyGeoserverLibs") {
    from(configurations["geoserver"])
    into(layout.buildDirectory.dir("geoserver"))
}
tasks.register<Sync>("copyLoggingLibs") {
    from(configurations["logging"])
    into(layout.buildDirectory.dir("logging"))
}

tasks.named("check") {
    dependsOn("copyGeoserverLibs")
    dependsOn("copyLoggingLibs")
}