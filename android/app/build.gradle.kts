import java.io.FileInputStream
import java.util.Properties

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
    ?: throw java.io.FileNotFoundException("Flutter SDK not found. Define location with flutter.sdk in the local.properties file.")

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
            val pair = String(java.util.Base64.getDecoder().decode(entry), Charsets.UTF_8).split("=")
            pair.first() to pair.last()
        }
}
println("LS_IS_STORE=${dartEnvVars["LS_IS_STORE"]}")
val packageName = if (dartEnvVars["LS_IS_STORE"] == "true") {
    "com.noaisu.play.loliSnatcher"
} else {
    "com.noaisu.loliSnatcher"
}
println("packageName=$packageName")
println("compileSdk=${flutter.compileSdkVersion}")
println("ndkVersion=${flutter.ndkVersion}")
println("minSdkVersion=${flutter.minSdkVersion}")
println("targetSdkVersion=${flutter.targetSdkVersion}")

android {
    namespace = "com.noaisu.loliSnatcher"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
        }
    }

    defaultConfig {
        applicationId = packageName
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
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
        }

        debug {
            signingConfig = if (keystoreProperties["storeFile"] != null) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }

    buildFeatures {
        buildConfig = true
    }
}

androidComponents {
    onVariants { variant ->
        variant.outputs.forEach { output ->
            // When building split apks, gradle adds (n * 1000) to each arch type to avoid having same build number
            // This disables that behaviour and uses same build number for all arch variants
            (output as com.android.build.api.variant.impl.VariantOutputImpl).versionCode.set(variant.outputs.first().versionCode.get())
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:2.1.0")
    implementation("androidx.documentfile:documentfile:1.0.1")
}
