$filename = Read-Host -Prompt "Enter file name"
$extension = Read-Host -Prompt "Enter file extension"
$sourcePath = "C:\Users\pavan\Documents\PS-Scripts\templates\template.$extension"
$destinationPath = Join-Path $PWD.Path "$filename.$extension"

Copy-Item -Path $sourcePath -Destination $destinationPath -Force

Write-Host "$filename.$extension created successfully"
