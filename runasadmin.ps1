$currentdir = [System.Environment]::CurrentDirectory
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
$tempdir = $currentdir + "\Downloads\stuff\"
$filepath = $currentdir + "\Downloads\stuff\changedns.ps1"
mkdir $tempdir
Write-Output $tempdir
Write-Output $filepath
Invoke-WebRequest $DownloadURL -outfile $filepath
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath
Remove-Item -Force -Recurse $tempdir