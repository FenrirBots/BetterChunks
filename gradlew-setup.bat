@echo off

:: Local variables---------------------------------------------
:: --- Local variables for use in the script
set gradle_version=6.8.3
set gradle_url=https://downloads.gradle-dn.com/distributions/gradle-%gradle_version%-bin.zip


:: Download----------------------------------------------------
:: --- Download gradle from gradle.orb
:download
    curl --output %temp%\gradle-bin.zip --url %gradle_url%
    if not [%errorlevel%]==[0] goto pause

    powershell Expand-Archive -Force "'%temp%\gradle-bin.zip' '%TEMP%\gradle-bin'"
    if not [%errorlevel%]==[0] goto pause

    :: Calling gradle with the following command line: wrapper --gradle-version
    :: creates gradlew in the current working directory
    call "%temp%\gradle-bin\gradle-%gradle_version%\bin\gradle.bat" wrapper --gradle-version %gradle_version%
    if not [%errorlevel%]==[0] goto pause

goto cleanup


:: Cleanup-----------------------------------------------------
:: --- Cleanup the temporary files used during the download
:cleanup
    del %temp%\gradle-bin.zip /f /q
    if not [%errorlevel%]==[0] goto pause

    rmdir /s /q %temp%\gradle-bin
    if not [%errorlevel%]==[0] goto pause

goto setup


:: Setup-------------------------------------------------------
:: --- Setup the gradle environment
:setup
    call gradlew.bat setupDecompWorkspace
    if not [%errorlevel%]==[0] goto pause

    call gradlew.bat --refresh-dependencies
    if not [%errorlevel%]==[0] goto pause

goto exit


:pause
    echo.
    echo [ERROR]An error has occurred.
    echo [ERROR]If you are seeing this, please notify the creator of this script.
    pause

:exit
pause
    exit