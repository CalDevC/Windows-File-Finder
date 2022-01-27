#Load constant variables
. .\const.ps1

#Clear file contents
Set-Content -Path ".\$detected" -Value ""
Set-Content -Path ".\$notDetected" -Value ""
Set-Content -Path ".\$tempFound" -Value ""

#Get info from user about the type of search and validate
Write-Host "Enter the search type (R - recursive OR L - local): "
$searchType = Read-Host

if ($searchType -ne "R" -AND $searchType -ne "r" -AND $searchType -ne "L" -AND $searchType -ne "l") {
  Write-Host "Invalid search type entered"
}

Write-Host "Enter the search term type (R - range OR P - phrase): "
$searchTermType = Read-Host

if ($searchTermType -eq "P" -OR $searchTermType -eq "p") {
  . .\phraseSearch.ps1
}
elseif ($searchTermType -eq "P" -OR $searchTermType -eq "p") {
  . .\rangeSearch.ps1
}
else {
  Write-Host "Invalid search term type entered"
}


