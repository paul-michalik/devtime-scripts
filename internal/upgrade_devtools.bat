choco upgrade -y cmake.install --install-arguments='"ADD_CMAKE_TO_PATH=System"' ^
 && choco upgrade -y git.install -params "/NoShellIntegration /GitOnlyOnPath /WindowsTerminal /SChannel" ^
 && choco upgrade -y all