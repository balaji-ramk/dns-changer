$DownloadURL = "C:\Users\bala\Documents\code\dns-changer\dns-changer\changedns.ps1"
$response = Invoke-WebRequest -Uri $DownloadURL -UseBasicParsing

Start-Process PowerShell -Verb RunAs -ArgumentList 