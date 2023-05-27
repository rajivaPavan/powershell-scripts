# print command with blue color and no newline
function printb($str) {
    Write-Host $str -NoNewline -ForegroundColor Blue
}

# print command description with white color
function printd($str) {
    Write-Host $str -ForegroundColor White
}

# dictionary of commands and descriptions
$commands = @{
    "my-commands" = "print all commands and descriptions"
    
    "fromtemplate" = "use template to create a new file of specified type"
    
    "clearss" = "clear screenshots from the default screenshot folder
    -a : clear all screenshots
    -t : clear screenshots taken today
    -w : clear screenshots taken this week
    -m : clear screenshots taken this month
    -o : open screenshot folder"
    
    "downloads" = "analyse/open downloads folder
    -a : analyse downloads folder
    -o : open downloads folder"

    "open-pdfs" = "open all pdfs in the current folder in the default pdf reader"

}

# loop through commands and print them
foreach ($command in $commands.GetEnumerator()) {
    printb $command.Key
    printb " : "
    printd $command.Value
}

