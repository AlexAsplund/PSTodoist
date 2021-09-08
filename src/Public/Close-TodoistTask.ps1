<#
.SYNOPSIS
    Closes a Todoist task
.DESCRIPTION
    Closes a Todoist task, can either be via array or INT array.
    Can also be supplied through pipeline
.EXAMPLE
    Close-TodoistTask -Id 123456789
.EXAMPLE
    Close-TodoistTask -Id 098765432,123466721
.EXAMPLE
    Get-TodoistTask | ? {$_.Content -match "Stop Procrastinating"} | Close-TodoistTask
#>
function Close-TodoistTask
{
    [cmdletbinding()]
    param(
        # Id of the todoist task
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
        
            $Uri = "https://api.todoist.com/rest/v1/tasks/$_/close"
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