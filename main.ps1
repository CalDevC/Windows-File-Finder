#Load constant variables
. .\const.ps1

#Clear file contents
Set-Content -Path ".\$detected" -Value ""
Set-Content -Path ".\$notDetected" -Value ""
Set-Content -Path ".\$tempFound" -Value ""

#Get info from user about the type of search and validate
Write-Host "Enter the search type (R - recursive OR L - local): "
$searchType = Read-Host

if ($searchType -notin $searchTypes) {
  Write-Host "Invalid search type entered"
}

Write-Host "Enter the search term type (R - range OR P - phrase): "
$searchTermType = Read-Host

if ($searchTermType -notin $termTypes) {
  Write-Host "Invalid search term type entered"
}

#Launch either a phrase or range search
if ($searchTermType -eq "P" -OR $searchTermType -eq "p") {
  . .\phraseSearch.ps1
}
elseif ($searchTermType -eq "R" -OR $searchTermType -eq "r") {
  . .\rangeSearch.ps1
}


