mkdir stuff
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
# Invoke-WebRequest $DownloadURL -outfile %userprofile%\Downloads\stuff\changedns.ps1
# $response = Invoke-WebRequest $DownloadURL
Invoke-WebRequest $DownloadURL -outfile stuff\changedns.ps1
# $response = "C:\Users\bala\Documents\code\dns-changer\dns-changer\changedns.ps1"
# $respcont = $response.Content
Start-Process PowerShell -Verb RunAs -ArgumentList "stuff\changedns.ps1"
