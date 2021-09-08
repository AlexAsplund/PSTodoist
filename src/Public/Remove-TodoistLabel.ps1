<#
.SYNOPSIS
    Removes a Todoist label
.DESCRIPTION
    Removes one or several Todoist labels, can either be via array or INT array.
    Can also be supplied through pipeline
.EXAMPLE
    Remove-TodoistLabel -Id 123456789
.EXAMPLE
    Remove-TodoistLabel -Id 098765432,123466721
.EXAMPLE
    Get-TodoistLabel | ? {$_.Content -match "Big"} | Remove-TodoistLabel
#>
function Remove-TodoistLabel
{
    [CmdletBinding()]
    param(
        # Id of todoist label
        [Parameter(
            ValueFromPipelineByPropertyName = $True,
            Mandatory = $True )]
        [int64[]]$Id,

        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [string]$Token = $Global:TodoistToken
    )
    
    begin
    {
        $Header = @{
            "Authorization" = "Bearer $($token)"
        }

        $Requests = $()
    }

    process
    {
        
        $Id | Foreach {
        
            $Uri = "https://api.todoist.com/rest/v1/labels/$_"
            Write-Output $Uri
            $Request = Invoke-RestMethod -Headers $Header -Method Delete -Uri $Uri
            $Requests += $Request
        }
    }

    end
    {
        return $Requests
    }
}