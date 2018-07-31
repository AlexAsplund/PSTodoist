<#
.SYNOPSIS
    Removes a Todoist comment
.DESCRIPTION
    Removes one or several Todoist comments, can either be via array or INT array.
    Can also be supplied through pipeline
.EXAMPLE
    Remove-TodoistComment -Id 123456789
.EXAMPLE
    Remove-TodoistComment -Id 098765432,123466721
.EXAMPLE
    Get-TodoistComment | ? {$_.Content -match "Big"} | Remove-TodoistComment
#>
function Remove-TodoistComment
{
    [CmdletBinding()]
    param(
        # Id of todoist comment
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
        
            $Uri = "https://beta.todoist.com/API/v8/comments/$_"
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