param (
    [string]$folder
)

Write-Host 'Processing folder: ' $folder
Get-ChildItem -Path $folder -Recurse -Include '*.sh' `
    | Where-Object{ `
             $_.FullName -notlike "*\.git\*" `
        -and $_.FullName -notlike "*\.terraform\*" `
        -and $_.FullName -notlike "*\bin\*" `
    }`
    | foreach {
        Push-Location $_.DirectoryName
        Write-Host 'Current directory: ' $(Get-Location)
        git update-index --verbose --add --chmod=+x $($_.Name)
        Pop-Location
    }