@echo off

choco upgrade -y cmake.install --install-arguments='"ADD_CMAKE_TO_PATH=System"' ^
  && choco upgrade -y git.install -params "/NoShellIntegration /GitOnlyOnPath /WindowsTerminal /SChannel" ^
  && choco upgrade -y all

REM Apply registry configurtaion to enable usage of bash scripts. This changes every time git is updated! 
echo Invoking: reg import %~dp0sh_auto_file.reg
reg import "%~dp0sh_auto_file.reg"

REM Add 'C:\Program Files\Git\bin' to system 'Path' to get 'bash' from Git
if "%Path%"=="%Path:C:\Program Files\Git\bin;=%" (
	echo C:\Program Files\Git\bin; not contained in Path, adding
	setx Path /m "C:\Program Files\Git\bin;%Path%"
) else (
	echo C:\Program Files\Git\bin; already contained in Path, do nothing
)

REM Update current shell with modified environment variables
RefreshEnv