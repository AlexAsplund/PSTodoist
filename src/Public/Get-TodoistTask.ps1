<#
.SYNOPSIS
    Gets all open todoist tasks and gives them back in [TodoistTask] type form
.DESCRIPTION
    Gets all open todoist tasks and gives them back in [TodoistTask] type form.
    The output can later on be used for running class methods for easy administration.
.EXAMPLE
    Get-TodoistTask
.EXAMPLE
    Get-TodoistTask -Token 1q2w3e4r5t6y7u8i99o0p
.EXAMPLE
    $Tasks = Get-TodoistTask | ? {$_.Content -match "dishes"}
    $Tasks.Close()
#>
function Get-TodoistTask
{
    [CmdletBinding()]
    param(
        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [parameter(ValueFromPipelineByPropertyName = $True)]
        [string]$Token = $Global:TodoistToken
    )
    
    begin
    {
        
        Write-Verbose "Beginning to fetch tasks"
        
        $Header = @{
            'Content-Type'  = "application/json"
            "Authorization" = "Bearer $($Token)"
        }
    }

    process
    {
        $Request = Invoke-RestMethod -Headers $Header -Method Get -Uri 'https://beta.todoist.com/API/v8/tasks' 
        
        $Tasks = @()
        
        foreach ($Task in $Request)
        {
            try
            {
                $Tasks += [TodoistTask]::new($Task)
            }
            catch
            {
                Write-Error $_
                
            }
        }
    }

    end
    {
        Return $Tasks
    }
    
}