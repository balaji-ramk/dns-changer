$currentdir = [System.Environment]::CurrentDirectory
$tempdir = $currentdir + "\stuff"
$filepath = $currentdir + "\stuff\changedns.ps1"
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
mkdir $tempdir
echo $tempdir
echo $filepath
Invoke-WebRequest $DownloadURL -outfile $filepath
Start-Process PowerShell -Verb RunAs -ArgumentList $filepath
Remove-Item -Force -Recurse $tempdir