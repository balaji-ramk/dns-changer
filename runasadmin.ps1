# variables
$DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
$tempdir = "$env:userprofile\Downloads\dns-changer-temp\"
$filepath = $tempdir + "changedns.ps1"

Set-Location $env:userprofile\Downloads
mkdir dns-changer-temp
function Show-Menu
{
     param (
           [string]$Title = 'Choose an Option'
     )
     Clear-Host
     Write-Host “================ $Title ================”
    
     Write-Host “1: Press 1 to change DNS”
     Write-Host “2: Press 2 for a soft reset”
     Write-Host “3: Press 3 for a hard reset (you will lose your passwords)”
     Write-Host “0: Press 0 to quit.”
}

function Worker
{
    Invoke-WebRequest $DownloadURL -OutFile $filepath
    Write-Output $filepath
    Start-Process PowerShell -Verb RunAs -ArgumentList $filepath
}

do
{
     Show-Menu
     $choice = Read-Host “Please make a selection”
     switch ($choice)
     {
           '1' {
                Clear-Host
                $DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/changedns.ps1"
                Worker
           } '2' {
                Clear-Host
                $DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/softreset.ps1"
                Worker
           } '3' {
                Clear-Host
                $DownloadURL = "https://raw.githubusercontent.com/balaji-ramk/dns-changer/main/hardreset.ps1"
                Worker
           } '0' {
                return
           }
     }
     pause
}
until ($input -eq '0')

#before exiting
Remove-Item -Force -Recurse dns-changer-temp
Set-Location ..