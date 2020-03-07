choco install -y cmake.install --install-arguments='"ADD_CMAKE_TO_PATH=System"'

choco install -y git.install -params "/NoShellIntegration /GitOnlyOnPath /WindowsTerminal /SChannel"

choco install -y tortoisegit GitVersion.Portable GitDepend.Portable previewconfig winmerge docker-desktop awscli jq zip unzip