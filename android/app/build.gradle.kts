import com.android.build.gradle.internal.api.ApkVariantOutputImpl
import java.io.FileInputStream
import java.io.FileNotFoundException
import java.util.Base64
import java.util.Properties
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader(Charsets.UTF_8).use { reader ->
        localProperties.load(reader)
    }
}

val flutterRoot = localProperties.getProperty("flutter.sdk")
    ?: throw FileNotFoundException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

var dartEnvVars = mapOf(
    "LS_IS_STORE" to "false",
    "LS_IS_TESTING" to "false"
)
if (project.hasProperty("dart-defines")) {
    dartEnvVars = dartEnvVars + (project.property("dart-defines") as String)
        .split(",")
        .associate { entry ->
            val pair = String(Base64.getDecoder().decode(entry), Charsets.UTF_8).split("=")
            pair.first() to pair.last()
        }
}
println("LS_IS_STORE=${dartEnvVars["LS_IS_STORE"]}")
val packageName = if (dartEnvVars["LS_IS_STORE"] == "true") {
    "com.noaisu.play.losn"
} else {
    "com.noaisu.loliSnatcher"
}
val androidApiLevel = 37
println("packageName=$packageName")
println("compileSdk=$androidApiLevel")
println("ndkVersion=${flutter.ndkVersion}")
println("minSdkVersion=${flutter.minSdkVersion}")
println("targetSdkVersion=$androidApiLevel")

android {
    namespace = "com.noaisu.loliSnatcher"

    compileSdk = androidApiLevel
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
        }
    }

    defaultConfig {
        applicationId = packageName
        minSdk = flutter.minSdkVersion
        targetSdk = androidApiLevel
        versionCode = flutterVersionCode.toInt()
        versionName = flutterVersionName
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as? String
            keyPassword = keystoreProperties["keyPassword"] as? String
            storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = keystoreProperties["storePassword"] as? String
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
        }

        debug {
            signingConfig = if (keystoreProperties["storeFile"] != null) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }

    packagingOptions {
        jniLibs {
            // decreases APK size by ~40-50%, but maybe conflicts with 16KB page size devices?
            // possibly increases install and startup time
            // not used on play store builds
            useLegacyPackaging = dartEnvVars["LS_IS_STORE"] != "true"
        }
    }

    applicationVariants.all {
        outputs.all {
            val output = this as? ApkVariantOutputImpl
            // Override the version code to be the 'flutterVersionCode'
            // ignoring the ABI-specific logic added by Flutter
            output?.versionCodeOverride = flutterVersionCode.toInt()
        }
    }

    buildFeatures {
        buildConfig = true
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:2.1.0")
    implementation("androidx.documentfile:documentfile:1.0.1")
}
