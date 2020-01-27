@echo off
setlocal
    call "%~dp0abspath.bat" "%~dp1"
    call "%ProgramW6432%\Git\usr\bin\dos2unix.exe" "%AbsPath%%~nx1%"
endlocal && exit /b %errorlevel%