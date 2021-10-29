choco install -y cmake.install --install-arguments='"ADD_CMAKE_TO_PATH=System"' ^
 && choco install -y git.install -params "/NoShellIntegration /GitOnlyOnPath /WindowsTerminal /SChannel" ^
 && choco install -y ^
 tortoisegit GitVersion.Portable GitDepend.Portable previewconfig winmerge awscli jq zip unzip

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

REM  No vscode, this is too aggresive
REM choco install -y vscode.install --params "/NoDesktopIcon /NoContextMenuFiles /NoContextMenuFolders /DontAssociateWithFiles /NoQuicklaunchIcon"
