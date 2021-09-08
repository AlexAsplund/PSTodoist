<#
.SYNOPSIS
    Removes a Todoist project
.DESCRIPTION
    Removes one or several Todoist project, can either be via array or INT array.
    Can also be supplied through pipeline
.EXAMPLE
    Remove-TodoistProject -Id 123456789
.EXAMPLE
    Remove-TodoistProject -Id 098765432,123466721
.EXAMPLE
    Get-TodoistProject | ? {$_.Content -match "Big"} | Remove-TodoistProject
#>
function Remove-TodoistProject
{
    [CmdletBinding()]
    param(
        # Id of todoist project
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
        
            $Uri = "https://api.todoist.com/rest/v1/projects/$_"
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