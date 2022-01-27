#Get info from user about the search
Write-Host "Enter the keyword phrase: "
$phrase = Read-Host

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
[string]$content = Get-Content -Path ".\$tempFound"
if ($content -eq "") {
  Add-Content -Path ".\$notDetected" -Value $phrase
}
else {
  Get-Content -Path ".\$tempFound" | Add-Content -Path ".\$detected"
}