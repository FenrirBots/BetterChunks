@echo off

set GRADLE="%cd%/gradlew.bat"

call %GRADLE% clean

if [%errorlevel%]==[1] pause