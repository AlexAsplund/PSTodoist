<#
.SYNOPSIS
    Gets all open todoist projects
.DESCRIPTION
    Gets all open todoist projects
.EXAMPLE
    Get-Todoistproject
.EXAMPLE
    Get-Todoistproject -Token 1q2w3e4r5t6y7u8i99o0p
.EXAMPLE
    $projects = Get-Todoistproject | ? {$_.Content -match "Do dishes"} | Remove-TodoistProject
#>
function Get-TodoistProject
{
    [CmdletBinding()]
    param(
        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [parameter(ValueFromPipelineByPropertyName = $True)]
        [string]$Token = $Global:TodoistToken
    )
    
    begin
    {
        
        Write-Verbose "Beginning to fetch projects"
        
        $Header = @{
            'Content-Type'  = "application/json"
            "Authorization" = "Bearer $($Token)"
        }
    }

    process
    {
        $Request = Invoke-RestMethod -Headers $Header -Method Get -Uri 'https://api.todoist.com/rest/v1/projects' 
        
        $projects = @()
        
        foreach ($project in $Request)
        {
            try
            {
                $projects += $Project
            }
            catch
            {
                Write-Error $_
                
            }
        }
    }

    end
    {
        Return $projects
    }
    
}