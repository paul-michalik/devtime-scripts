@echo off
setlocal
    call "%~dp0abspath.bat" "%~dp1"
    call "%ProgramW6432%\Git\bin\bash.exe" -c "%AbsPath%/%~nx1"
endlocal && exit /b %errorlevel%