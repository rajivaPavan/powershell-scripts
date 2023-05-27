param (
    [switch]$All,
    [switch]$Today,
    [switch]$Week,
    [switch]$Month,
    [switch]$OpenFolder
)

function Clear-Screenshots {
    $screenshotFolder = "C:\Users\pavan\OneDrive\Pictures\Screenshots"
    $filter = "*.png" # Change the filter if your screenshots have a different extension
    
    $date = Get-Date
    $startDate = $date.Date
    $endDate = $startDate.AddDays(1)
    
    if ($All) {
        $screenshots = Get-ChildItem -Path $screenshotFolder -Filter $filter -File
    }
    elseif ($Today) {
        $screenshots = Get-ChildItem -Path $screenshotFolder -Filter $filter -File | Where-Object {
            $_.CreationTime -ge $startDate -and $_.CreationTime -lt $endDate
        }
    }
    elseif ($Week) {
        $startDate = $date.AddDays(-$date.DayOfWeek.value__ + 1)
        $endDate = $startDate.AddDays(7)
        $screenshots = Get-ChildItem -Path $screenshotFolder -Filter $filter -File | Where-Object {
            $_.CreationTime -ge $startDate -and $_.CreationTime -lt $endDate
        }
    }
    elseif ($Month) {
        $startDate = $date.AddDays(-$date.Day + 1)
        $endDate = $startDate.AddMonths(1)
        $screenshots = Get-ChildItem -Path $screenshotFolder -Filter $filter -File | Where-Object {
            $_.CreationTime -ge $startDate -and $_.CreationTime -lt $endDate
        }
    }
    
    if ($screenshots) {
        $screenshots | Remove-Item -Force
        Write-Host "Screenshots cleared successfully."
    }
    else {
        Write-Host "No screenshots found within the specified time period."
    }
    
    if ($OpenFolder) {
        Invoke-Item -Path $screenshotFolder
    }
}

Clear-Screenshots
