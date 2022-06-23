@echo off

set GRADLE_PATH="%cd%/gradlew.bat"

call %GRADLE_PATH% build

if [%errorlevel%]==[1] pause