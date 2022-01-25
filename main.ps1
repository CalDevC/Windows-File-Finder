#Get drive name
Write-Host "Enter the Network folder do you want to search: "
$folder = Read-Host

Write-Host "Enter the keyword phrase: "
$phrase = Read-Host

#Mount temporary network drive
# New-PSDrive -Name T -PSProvider FileSystem -Root \\upifile1\$folder

Get-ChildItem -Path "\\upifile1\${folder}" -Name -Include *$phrase*
