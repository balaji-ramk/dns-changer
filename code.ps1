Function launcher()
{
  #Get current user context
  $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  
  #Check user is running the script is member of Administrator Group
  if($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
  {
       Write-host "Script is running with Administrator privileges!"
  }
  else
    {
     #   #Create a new Elevated process to Start PowerShell
     #   $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
 
     #   # Specify the current script path and name as a parameter
     #   $ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
 
     #   #Set the Process to elevated
     #   $ElevatedProcess.Verb = "runas"
 
     #   #Start the new elevated process
     #   [System.Diagnostics.Process]::Start($ElevatedProcess)
 
     #   #Exit from the current, unelevated, process
     #   Exit
     Start-Process PowerShell -Verb RunAs -ArgumentList 'iwr "https://raw.githubusercontent.com/balaji-ramk/network-helper/main/code.ps1" -UseBasicParsing | iex'
     Exit
 
    }
}
 
#Check Script is running with Elevated Privileges
launcher
 
#Script starts here.
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
function Select-DNS
{
     Show-DNSOptions
     $choice = Read-Host "Please make a selection: "
     switch ($choice)
     {
               '1' {
                    Clear-Host
                    Write-Output "Changing to Clouflare DNS"
                    Set-DNSClientServerAddress * -ServerAddresses ("1.1.1.1","1.0.0.1","2606:4700:4700::1111","2606:4700:4700::1001")

               } '2' {
                    Clear-Host
                    Write-Host "Changing to Adguard Public DNS!"
                    Set-DNSClientServerAddress * -ServerAddresses ("94.140.14.14","94.140.15.15","2a10:50c0::ad1:ff","2a10:50c0::ad2:ff")
               
               } '3' {
                    Clear-Host
                    Write-Host "Changing to Mullvad Adblocking DNS!"
                    Set-DNSClientServerAddress * -ServerAddresses ("194.242.2.3",,"2a07:e340::3")
                    
               } '4' {
                    Clear-Host
                    Write-Host "Changing to Quad9 Privacy DNS!"
                    Set-DNSClientServerAddress * -ServerAddresses ("9.9.9.9","149.112.112.112","2620:fe::fe","2620:fe::9")
               } '5' {
                    Clear-Host
                    Write-Host "Changing to Google Public DNS!"
                    Set-DNSClientServerAddress * -ServerAddresses ("8.8.8.8","8.8.4.4","2001:4860:4860::8888","2001:4860:4860::8844")
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
                Select-DNS
                ipconfig /flushdns
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
