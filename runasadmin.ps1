# variables
# $currentdir = [System.Environment]::CurrentDirectory
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
$tempdir = "$env:userprofile\Downloads\dns-changer-temp"
$filepath = $tempdir + "\changedns.ps1"

# commands
Set-Location $env:userprofile\Downloads
mkdir dns-changer-temp
Invoke-WebRequest $DownloadURL -OutFile $filepath

Write-Output $filepath
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath
Remove-Item -Force -Recurse $tempdir

Set-Location ..