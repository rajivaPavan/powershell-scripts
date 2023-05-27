$directory = Get-Location

# Get all PDF files in the current directory and its subdirectories
$pdfFiles = Get-ChildItem -Path $directory -Filter "*.pdf" -File -Recurse

# Loop through each PDF file and open it in the default browser
foreach ($file in $pdfFiles) {
    $file.FullName | ForEach-Object {
        Start-Process $_
    }
}
