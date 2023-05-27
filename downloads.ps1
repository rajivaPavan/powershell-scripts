param (
    [switch]$Analyse,
    [switch]$OpenFolder
)

function Analyse-DownloadsFolder {
    $downloadsFolder = "C:\Users\pavan\Downloads"
    $fileExtensions = Get-ChildItem -Path $downloadsFolder -File | Group-Object -Property Extension -NoElement

    $totalFiles = (Get-ChildItem -Path $downloadsFolder -File).Count
    $totalSize = (Get-ChildItem -Path $downloadsFolder -File | Measure-Object -Property Length -Sum).Sum
    $sizeInMB = $totalSize / 1MB

    Write-Host "Downloads Folder Analysis"
    Write-Host "-------------------------"
    Write-Host "Total Files: $totalFiles"
    Write-Host "Total Size: $sizeInMB MB"
    Write-Host "-------------------------"
    Write-Host "File Extensions:"

    foreach ($extension in $fileExtensions) {
        $ext = if ($extension.Name -eq "") { "No Extension" } else { $extension.Name }
        $count = $extension.Count
        Write-Host "$ext : $count"
    }
}

if ($Analyse) {
    Analyse-DownloadsFolder
}

if ($OpenFolder) {
    $downloadsFolder = [Environment]::GetFolderPath("Downloads")
    Invoke-Item -Path $downloadsFolder
}
