#variables
Set-Location Downloads
# $currentdir = [System.Environment]::CurrentDirectory
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
# $tempdir = $currentdir + "\dnschanger_temp"
# $filepath = $currentdir + "\dnschanger_temp\changedns.ps1"

#commands
# New-Item -itemtype Directory -Path dnschanger_temp
Invoke-WebRequest $DownloadURL -OutFile "changedns.ps1"
Start-Process PowerShell -Verb RunAs -ArgumentList "changedns.ps1"
# Remove-Item -Force -Recurse dnschanger_temp
