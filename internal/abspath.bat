@echo off

rem ==============================================
rem Convert given path to absolute path with Unix token separators
rem ==============================================

setlocal
    set "AbsPathNative=%~f1"
    set "AbsPath=%AbsPathNative%"
    set "AbsPath=%AbsPath:\=/%"
endlocal & set "AbsPath=%AbsPath%" & set "AbsPathNative=%AbsPathNative%"