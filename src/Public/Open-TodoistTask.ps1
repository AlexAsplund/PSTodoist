<#
.SYNOPSIS
    Opens a previously closed Todoist task
.DESCRIPTION
    Opens a previously closed Todoist task, can either be via array or INT array.
    Can also be supplied through pipeline
.EXAMPLE
    Open-TodoistTask -Id 123456789
.EXAMPLE
    Open-TodoistTask -Id 098765432,123466721
.EXAMPLE
    Get-TodoistTask | ? {$_.Content -match "Start Procrastinating"} | Open-TodoistTask
#>
function Open-TodoistTask
{
    [CmdletBinding()]
    param(
        # Id of todoist task
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
        
            $Uri = "https://api.todoist.com/rest/v1/tasks/$_/reopen"
            Write-Output $Uri
            $Request = Invoke-RestMethod -Headers $Header -Method Post -Uri $Uri
            $Requests += $Request
        }
    }

    end
    {
        return $Requests
    }
}