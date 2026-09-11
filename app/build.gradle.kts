import org.gradle.api.tasks.testing.logging.TestLogEvent

plugins {
    alias(libs.plugins.kotlin.jvm)
    // Apply the Application plugin to add support for building an executable JVM application.
    application
}

configurations {
    register("geoserver"){
        isTransitive = false
    }

    register("logging") {
        isTransitive = false
    }
}

kotlin {
    // Use a specific Java version to make it easier to work in different environments.
    jvmToolchain(21)
}

dependencies {
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
tasks.register<Sync>("copyLoggingLibs") {
    from(configurations["logging"])
    into(layout.buildDirectory.dir("logging"))
}

tasks.withType<Test>().configureEach {
    // Configure all test Gradle tasks to use JUnitPlatform.
    useJUnitPlatform()

    // Log information about all test results, not only the failed ones.
    testLogging {
        events(
            TestLogEvent.FAILED,
            TestLogEvent.PASSED,
            TestLogEvent.SKIPPED
        )
    }
}
