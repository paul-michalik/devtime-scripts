@echo off
setlocal
    powershell -command "& {Get-ChildItem . -Recurse -Name -Filter '*.sh' | foreach { git update-index --verbose --add --chmod=+x $_ }}"
endlocal && exit /b %errorlevel%