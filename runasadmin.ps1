#variables
$currentdir = [System.Environment]::CurrentDirectory
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
$tempdir = $currentdir + "\Downloads\dns-changer-temp\"
$filepath = $tempdir + "changedns.ps1"

#commands
mkdir $tempdir
Write-Output $tempdir
Write-Output $filepath
Invoke-WebRequest $DownloadURL -outfile $filepath
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath
Remove-Item -Force -Recurse $tempdir