#Load constant variables
. .\const.ps1

#Clear file contents
Set-Content -Path ".\$detected" -Value ""
Set-Content -Path ".\$notDetected" -Value ""
Set-Content -Path ".\$tempFound" -Value ""

# #Get info from user about the type of search
# Write-Host "Enter the search type (R - recursive OR L - local): "
# $searchType = Read-Host

# Write-Host "Enter the search term type (R - range OR P - phrase): "
# $searchTermType = Read-Host

#Get info from user about the search
Write-Host "Enter the path to the Network folder do you want to search (begin with \\): "
$folder = Read-Host

Write-Host "Enter the keyword phrase: "
$phrase = Read-Host

Write-Host "Enter the types of files to search as a comma seperated list (no spaces): "
$fileTypes = Read-Host

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


