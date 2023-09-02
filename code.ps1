$ipv41 = ""
$ipv42 = ""
$ipv61 = ""
$ipv62 = ""
function Show-Menu
{
    Clear-Host
    Write-Host Choose an Option: 
    Write-Host "1. Press 1 to change the DNS Servers"
    Write-Host "2. Press 2 for a soft reset for internet"
    Write-Host "3. Press 3 for a hard reset for internet"
    Write-Host "0. Press 0 to exit"
}

function Show-DNSOptions{
     Clear-Host
     Write-Host Choose an Option: 
     Write-Host "1. Cloudflare (Recommended)"
     Write-Host "2. Adguard (Ad Blocking)"
     Write-Host "3. Mullvad (Ad Blocking)"
     Write-Host "4. Quad9"
     Write-Host "5. Google (Not Recommended unless necessary)"
     Write-Host "0. Press 0 to exit"
}
function Select-DNS($ipv41,$ipv42,$ipv61,$ipv62)
{
     "ipv41: $ipv41; ipv42: $ipv42; ipv61: $ipv61; ipv62: $ipv62"
     Show-DNSOptions
     $choice = Read-Host "Please make a selection: "
     switch ($choice)
     {
               '1' {
                    Clear-Host
                    Write-Output "Changing to Clouflare DNS"
                    $ipv41 = "1.1.1.1"
                    $ipv42 = "1.0.0.1"
                    $ipv61 = "2606:4700:4700::1111"
                    $ipv62 = "2606:4700:4700::1001"
                    Set-DNSClientServerAddress * -ServerAddresses ($ipv41,$ipv42,$ipv61,$ipv62)

               } '2' {
                    Clear-Host
                    Write-Host "Changing to Adguard Public DNS!"
                    $ipv41 = "94.140.14.14"
                    $ipv42 = "94.140.15.15"
                    $ipv61 = "2a10:50c0::ad1:ff"
                    $ipv62 = "2a10:50c0::ad2:ff"
                    Set-DNSClientServerAddress * -ServerAddresses ($ipv41,$ipv42,$ipv61,$ipv62)
               
               } '3' {
                    Clear-Host
                    Write-Host "Changing to Mullvad Adblocking DNS!"
                    $ipv41 = "194.242.2.3"
                    $ipv42 = ""
                    $ipv61 = "2a07:e340::3"
                    $ipv62 = ""
                    Set-DNSClientServerAddress * -ServerAddresses ($ipv41,$ipv42,$ipv61,$ipv62)
                    
               } '4' {
                    Write-Host "Changing to Quad9 Privacy DNS!"
                    $ipv41 = "9.9.9.9"
                    $ipv42 = "149.112.112.112"
                    $ipv61 = "2620:fe::fe"
                    $ipv62 = "2620:fe::9"
                    Set-DNSClientServerAddress * -ServerAddresses ($ipv41,$ipv42,$ipv61,$ipv62)
               } '5' {
                    Clear-Host
                    Write-Host "Changing to Google Public DNS!"
                    $ipv41 = "8.8.8.8"
                    $ipv42 = "8.8.4.4"
                    $ipv61 = "2001:4860:4860::8888"
                    $ipv62 = "2001:4860:4860::8844"
                    Set-DNSClientServerAddress * -ServerAddresses ($ipv41,$ipv42,$ipv61,$ipv62)
               } '0' {
                    return
               }
     }
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
                Show-DNSOptions
                Select-DNS($ipv41,$ipv42,$ipv61,$ipv62)
               #  Set-DNSClientServerAddress * -ServerAddresses ($ipv41,$ipv42,$ipv61,$ipv62)
                ipconfig /flushdns
                Write-Output $ipv41,$ipv42,$ipv61,$ipv62
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