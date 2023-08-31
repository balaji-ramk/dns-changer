mkdir stuff
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
Invoke-WebRequest $DownloadURL -outfile stuff\changedns.ps1
$test = [System.Environment]::CurrentDirectory + "\stuff\changedns.ps1"
Start-Process PowerShell -Verb RunAs -ArgumentList $test
