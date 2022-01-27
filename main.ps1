#Constant Variables
$detected = "detected.txt"
$notDetected = "notDetected.txt"
$tempFound = "temp.txt"

#Clear file contents
Clear-Content -Path ".\$detected"
Clear-Content -Path ".\$notDetected"
Clear-Content -Path ".\$tempFound"

#Get info from user about the search
Write-Host "Enter the path to the Network folder do you want to search (begin with \\): "
$folder = Read-Host

Write-Host "Enter the keyword phrase: "
$phrase = Read-Host

Write-Host "Enter the types of files to search as a comma seperated list (no spaces): "
$fileTypes = Read-Host

#Mount temporary network drive
# New-PSDrive -Name T -PSProvider FileSystem -Root \\upifile1\$folder

#For each provided file type
foreach ($type in $fileTypes.Split(",")) {
  $foundFiles = Get-ChildItem -Path "${folder}\*$type" -Name -Include *$phrase*
  Add-Content -Path ".\$tempFound" -Value $foundFiles
}

#Check if no files were found
if (Get-Content -Path ".\$tempFound" == "") {
  Add-Content -Path ".\$notDetected" -Value $searchterm
}
else {
  Add-Content -Path ".\$detected" -Value $detected
}


