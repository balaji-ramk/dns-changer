function Show-Menu
{
    Clear-Host
    Write-Host Choose an Option: 
    Write-Host "1. Press 1 to change the DNS Servers"
    Write-Host "2. Press 2 for a soft reset for internet"
    Write-Host "3. Press 3 for a hard reset for internet"
    Write-Host "0. Press 0 to exit"
}


do
{
    Show-Menu
    $choice = Read-Host "Please make a selection: "
    switch ($choice)
    {
           '1' {
                Clear-Host
                Write-Output "Changing DNS"
                Set-DNSClientServerAddress * -ServerAddresses ("1.1.1.1","1.0.0.1","2606:4700:4700::1111","2606:4700:4700::1001")
                Write-Output "DNS Servers Changed System-wide!"

           } '2' {
                Clear-Host
                ipconfig /release
                ipconfig /flushdns
                ipconfig /renew
            
           } '3' {
                Clear-Host
                net start dot3svc
                net start wlansvc
                netsh lan delete profile *
                netsh wlan delete profile *
                
           } '0' {
                return
           }
    }
    pause
}
until ($input -eq '0')