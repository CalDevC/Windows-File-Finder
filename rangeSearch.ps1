#Get info from user about the search
Write-Host "Enter the number range to search (separated by a `-` with no spaces): "
$range = Read-Host

#separate range values
$range = $range.Split("-")
[int]$lowerBound = $range[0]
[int]$upperBound = $range[1]

$prevContent = ""

#For each value in the specified range
for ($current = $lowerBound; $current -le $upperBound; $current += 1) {
  $phrase = $current.ToString()

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
  if ($content -eq $prevContent) {
    Add-Content -Path ".\$notDetected" -Value $phrase
    $prevContent = $content
  }
  else {
    Get-Content -Path ".\$tempFound" | Add-Content -Path ".\$detected"
  }

  Set-Content -Path ".\$tempFound" -Value ""
}

