<<<<<<< HEAD
# festive_care_cure

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


PS C:\festive_care_cure> flutter --version
Flutter 3.24.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 603104015d (9 months ago) • 2024-10-24 08:01:25 -0700
Engine • revision db49896cf2
Tools • Dart 3.5.4 • DevTools 2.37.3
PS C:\festive_care_cure> dart --version
Dart SDK version: 3.5.4 (stable) (Wed Oct 16 16:18:51 2024 +0000) on "windows_x64"
PS C:\festive_care_cure> node -v
v22.11.0
PS C:\festive_care_cure> npm -v
10.9.0
PS C:\festive_care_cure> git --version
git version 2.45.2.windows.1
PS C:\festive_care_cure> firebase --version
14.10.1
PS C:\festive_care_cure> java -version
java version "19.0.2" 2023-01-17
Java(TM) SE Runtime Environment (build 19.0.2+7-44)
Java HotSpot(TM) 64-Bit Server VM (build 19.0.2+7-44, mixed mode, sharing)
PS C:\festive_care_cure> 




gradle-wrapper.properties

distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.6-all.zip
# distributionUrl=https\://services.gradle.org/distributions/gradle-7.5-all.zip



# distributionUrl=https\://services.gradle.org/distributions/gradle-8.0.2-all.zip




android/build.gradle`  



buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Google services Gradle plugin

       
        
        // this one is also  compitable 
        // classpath 'com.android.tools.build:gradle:8.6'

        // Android Gradle plugin (compatible with Gradle 7.x)
        // Update to Kotlin 1.8.0
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:2.1.0"

        classpath 'com.google.gms:google-services:4.4.0'
        
        // classpath 'com.android.tools.build:gradle:8.6'  // Check latest version
        // classpath 'com.google.gms:google-services:4.4.2' // Ensure this is updated
    
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
         jcenter()
    }
}

rootProject.buildDir = "../build"

subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}



apply plugin: 'com.google.gms.google-services'


=======
# my_flutter_app
>>>>>>> edc728c7ffa61b585569d53654073b76f2e2885b
