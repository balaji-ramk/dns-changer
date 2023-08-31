#variables
$currentdir = [System.Environment]::CurrentDirectory
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
$filepath = $currentdir + "\dns-changer-temp\changedns.ps1"

#commands
New-Item -itemtype Directory -Path dns-changer-temp
Invoke-WebRequest $DownloadURL -outfile "dns-changer-temp\changedns.ps1"
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath
Remove-Item -Force -Recurse dns-changer-temp