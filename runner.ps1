# variables
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/code.ps1"
$filepath = "$env:userprofile\Downloads\dns-changer-temp\code.ps1"

Set-Location $env:userprofile\Downloads
mkdir dns-changer-temp

Invoke-WebRequest $DownloadURL -OutFile $filepath
Write-Output $filepath
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath

#before exiting
Remove-Item -Force -Recurse dns-changer-temp
Set-Location ..