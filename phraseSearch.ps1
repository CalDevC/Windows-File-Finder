#Get info from user about the search
Write-Host "Enter the path to the Network folder do you want to search (begin with \\): "
$folder = Read-Host

Write-Host "Enter the keyword phrase: "
$phrase = Read-Host

Write-Host "Enter the types of files to search as a comma seperated list (no spaces): "
$fileTypes = Read-Host

#For each provided file type
foreach ($type in $fileTypes.Split(",")) {
  if ($searchType -eq "r" -OR $searchType -eq "R") {
    $foundFiles = Get-ChildItem -Path "${folder}\*$type" -Name -Include *$phrase* -Recurse -Force
  }
  else {
    $foundFiles = Get-ChildItem -Path "${folder}\*$type" -Name -Include *$phrase*
  }
  
  Add-Content -Path ".\$tempFound" -Value $foundFiles
}

#Check if no files were found
if (Get-Content -Path ".\$tempFound" -eq "") {
  Add-Content -Path ".\$notDetected" -Value $phrase
}
else {
  Add-Content -Path ".\$detected" -Value $detected
}