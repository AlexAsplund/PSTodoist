<#
.SYNOPSIS
    Sets the SSL-setting of powershell to "tls12, tls11, tls" so that it supports pages with newer TLS settings
.EXAMPLE
    Set-TodoistSSLSettings
#>
function Set-TodoistSSLSettings
{   
    if ([Net.ServicePointManager]::SecurityProtocol -ne "tls12, tls11, tls")
    {
        Write-Verbose "Running command Set-TodoistSSLSettings"
        [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    }
}