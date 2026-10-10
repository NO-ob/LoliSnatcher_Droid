import com.android.build.api.dsl.LibraryExtension
import com.android.build.api.variant.LibraryAndroidComponentsExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    // Fix for build error after f3.44
    if (name == "flutter_avif_android") {
        plugins.withId("com.android.library") {
            extensions.configure<LibraryExtension>("android") {
                sourceSets.getByName("main") {
                    java.setSrcDirs(listOf("src/main/kotlin"))
                }
            }
        }
    }

    // Some pinned Flutter plugins still compile against API 31 or 33, while
    // their AndroidX dependencies require API 34 or newer.
    plugins.withId("com.android.library") {
        extensions.configure<LibraryAndroidComponentsExtension>("androidComponents") {
            finalizeDsl { android ->
                if ((android.compileSdk ?: 0) < 37) {
                    android.compileSdk = 37
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
