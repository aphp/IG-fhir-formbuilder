import com.github.gradle.node.npm.task.NpmTask
import com.github.gradle.node.npm.task.NpxTask
import java.nio.file.Files

repositories {
    mavenCentral()
}

plugins {
    id("java")
    id("com.github.node-gradle.node") version "7.0.1"
    id("de.undercouch.download") version "5.5.0"
}

fun sushiConfigVersion(): String {
    val sushiConfig = File(projectDir.absolutePath, "sushi-config.yaml")
    val version = sushiConfig.readLines().find {
        it.contains("version")
    }?.substringAfter("version: ")
    return version ?: "unknown"
}

group = "fr.aphp"
version = sushiConfigVersion()

node {
    download.set(
            true
    )
    version.set(
            properties["nodeVersion"] as? String
    )
}

defaultTasks(
        "cleanIG",
        "buildIG"
)

val igPackageManagerPath = "input-cache/manager.jar"
val igPackageManagerInstall = tasks.register<Task>("igPackageManagerInstall") {
    group = "build setup"
    doLast {
        val inputCacheDir = file("input-cache").toPath()
        val publisherJar = file(igPackageManagerPath).toPath()

        if (!Files.exists(inputCacheDir)) {
            Files.createDirectory(inputCacheDir)
        }

        if (!Files.exists(publisherJar)) {
            download.run {
                src(
                    "https://gitlab.data.aphp.fr/api/v4/projects/2285/packages/maven/fr/aphp/ig-package-manager/${properties["managerVersion"]}/ig-package-manager-${properties["managerVersion"]}.jar"
                )
                dest(
                    igPackageManagerPath
                )
                overwrite(
                    false
                )
            }
        }
    }
}

val igPackageManager = tasks.register<JavaExec>("igPackageManager") {
    group = "build"

    classpath(igPackageManagerPath)
    args = listOf(
        "-ig",
        "."
    )
    dependsOn(
            igPackageManagerInstall
    )
}

val sushiInstall = tasks.register<NpmTask>("sushiInstall") {
    args.set(
            listOf(
                    "install",
                    "fsh-sushi@${properties["sushiVersion"]}"
            )
    )
    dependsOn(
            tasks.nodeSetup,
            tasks.npmSetup,
            tasks.npmInstall
    )
}

val sushiBuild = tasks.register<NpxTask>("sushiBuild") {
    command.set("sushi")
    args.set(
            listOf(
                    "build",
                    "."
            )
    )
    dependsOn(
            igPackageManager,
            sushiInstall
    )
}

val igPublisherPath = "input-cache/publisher.jar"
val igPublisherInstall = tasks.register<Task>("igPublisherInstall") {
    group = "build setup"
    doLast {
        val inputCacheDir = file("input-cache").toPath()
        val publisherJar = file(igPublisherPath).toPath()

        if (!Files.exists(inputCacheDir)) {
            Files.createDirectory(inputCacheDir)
        }

        if (!Files.exists(publisherJar)) {
            download.run {
                src("https://github.com/HL7/fhir-ig-publisher/releases/download/${properties["publisherVersion"]}/publisher.jar")
                dest(igPublisherPath)
                overwrite(false)
            }
        }
    }
}

val igPublisherBuild = tasks.register<JavaExec>("igPublisherBuild") {
    group = "build"

    jvmArgs("-Dfile.encoding=UTF-8")
    classpath(igPublisherPath)
    args = listOf(
            "-no-sushi",
            "-tx ${properties["tx"]}",
            "-ig",
            "."
    )
    dependsOn(
            igPublisherInstall
    )
}

val buildIG = tasks.register<GradleBuild>("buildIG") {
    group = "build"

    tasks = listOf(
            "sushiBuild",
            "igPublisherBuild"
    )
}

val cleanIG = tasks.register<Delete>("cleanIG") {
    group = "build"

    delete(
            "fsh-generated",
            "output",
            "temp",
            "template",
            "input-cache/schemas",
            "input-cache/txcache",
            igPublisherPath,
            igPackageManagerPath,
            ".gradle/nodejs",
            "node_modules",
            "package.json",
            "package-lock.json"
    )
}

val goFshInstall = tasks.register<NpmTask>("goFshInstall") {
    args.set(
            listOf(
                    "install",
                    "gofsh@${properties["goFshVersion"]}"
            )
    )
    dependsOn(
            tasks.nodeSetup,
            tasks.npmSetup,
            tasks.npmInstall
    )
}

val goFshRun = tasks.register<NpxTask>("goFshRun") {
    command.set(
            "gofsh"
    )
    args.set(
            listOf(
                    "fhir",
                    "-o input/fsh/cim-10"
            )
    )
    dependsOn(
            goFshInstall
    )
}
