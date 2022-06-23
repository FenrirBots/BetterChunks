@echo off

set GRADLE_VER="6.8.3"
set GRADLE="%CD%/gradlew.bat"

:: build script
if not exist build.gradle REM. > build.gradle

:: Properties for the gradlew wrapper
if not exist gradle.properties REM. > gradle.properties

:: GradleW wrapper > Do not use
if not exist gradlew.bat REM. > gradlew.bat

call %GRADLE% wrapper --gradle-version %GRADLE_VER%
call %GRADLE% setupDecompWorkspace
call %GRADLE% --refresh-dependencies