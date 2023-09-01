# variables
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/code.ps1"
[String]$profile = $env:userprofile 
$filepath = $profile + "\Downloads\dns-changer-temp\code.ps1"

Set-Location $profile + "\Downloads"
mkdir dns-changer-temp

Invoke-WebRequest $DownloadURL -OutFile $filepath
Write-Output $filepath
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath

#before exiting
Remove-Item -Force -Recurse dns-changer-temp
Set-Location ..