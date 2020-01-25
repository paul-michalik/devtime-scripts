Get-ChildItem . -Recurse -Include '*.sh','*.py' | foreach { 
    $unixPath = $_.FullName -replace "\\","/"
    &'C:\Program Files\Git\usr\bin\dos2unix.exe' $unixPath
}