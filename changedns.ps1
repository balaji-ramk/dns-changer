Write-Output "Changing DNS"
Set-DNSClientServerAddress * -ServerAddresses ("1.1.1.1","1.0.0.1","2606:4700:4700::1111","2606:4700:4700::1001")
Write-Output DNS Servers Changed System-wide!
Remove-Item [System.Environment]::CurrentDirectory + "\stuff\changedns.ps1"
Read-Host -Prompt "Press Enter to exit"