@echo off

set GRADLE="%cd%/gradlew.bat"

call %GRADLE% build

if [%errorlevel%]==[1] pause