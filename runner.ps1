$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/code.ps1"
$userdir = "$env:userprofile"
$filepath = $userdir + "\Downloads\dns-changer-temp\code.ps1"

Set-Location $userdir + "\Downloads"
mkdir dns-changer-temp

Invoke-WebRequest $DownloadURL -OutFile $filepath
Write-Output $filepath
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath

# Remove-Item -Force -Recurse dns-changer-temp
Set-Location ..