#variables
#$currentdir = [System.Environment]::CurrentDirectory
#$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
#$tempdir = $currentdir + "\Downloads\dns-changer-temp\"
#$filepath = $tempdir + "changedns.ps1"

#commands
New-Item -itemtype Directory -Path dns-changer-temp
#Write-Output $tempdir
#Write-Output $filepath
Invoke-WebRequest $DownloadURL -outfile "dns-changer-temp\changedns.ps1"
Start-Process PowerShell -Verb RunAs -ArgumentList "dns-changer-temp\changedns.ps1"
# Remove-Item -Force -Recurse $tempdir