param (
    [string]$folder
)

Write-Host 'Processing folder: ' $folder
Get-ChildItem -Path $folder -Recurse -Include '*.tf','*.sh','*.py','[Mm]akefile' `
    | Where-Object{ `
             $_.FullName -notlike "*\.git\*" `
        -and $_.FullName -notlike "*\.terraform\*" `
        -and $_.FullName -notlike "*\bin\*" `
    }`
    | foreach { 
        $unixPath = $_.FullName -replace "\\","/"
        &'C:\Program Files\Git\usr\bin\dos2unix.exe' $unixPath
    }