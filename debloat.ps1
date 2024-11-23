$zipPath = "C:\Users\TheKrowBlooder\Desktop\AndroidDebloat.zip"
$tempFolder = [System.IO.Path]::Combine($env:TEMP, "thekrowblooder")

if (Test-Path $tempFolder) {
    Remove-Item -Path $tempFolder -Recurse -Force
}

New-Item -Path $tempFolder -ItemType Directory

Expand-Archive -Path $zipPath -DestinationPath $tempFolder -Force

$unistallerScript = Get-ChildItem -Path $tempFolder -Recurse -Filter "unistallerbeta.ps1" | Select-Object -First 1

if ($unistallerScript) {
    & $unistallerScript.FullName
} else {
    Get-ChildItem -Path $tempFolder -Recurse | ForEach-Object { Write-Host $_.FullName -ForegroundColor Yellow }
}
