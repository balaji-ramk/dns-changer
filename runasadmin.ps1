mkdir stuff
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
Invoke-WebRequest $DownloadURL -outfile stuff\changedns.ps1
$DNSChangerFile = [System.Environment]::CurrentDirectory + "\stuff\changedns.ps1"
$tempdir = [System.Environment]::CurrentDirectory + "\stuff\"
Start-Process PowerShell -Verb RunAs -ArgumentList $DNSChangerFile
Remove-Item -Force -Recurse $tempdir