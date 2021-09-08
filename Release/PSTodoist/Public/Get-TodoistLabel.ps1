<#
.SYNOPSIS
    Gets all todoist labels
.DESCRIPTION
    Gets all todoist labels
.EXAMPLE
    Get-Todoistlabel
.EXAMPLE
    Get-Todoistlabel -Token 1q2w3e4r5t6y7u8i99o0p
.EXAMPLE
    $labels = Get-Todoistlabel | ? {$_.Content -match "My label"}
#>
function Get-TodoistLabel
{
    [CmdletBinding()]
    param(
        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [parameter(ValueFromPipelineByPropertyName = $True)]
        [string]$Token = $Global:TodoistToken
    )
    
    begin
    {
        
        Write-Verbose "Beginning to fetch labels"
        
        $Header = @{
            'Content-Type'  = "application/json"
            "Authorization" = "Bearer $($Token)"
        }
    }

    process
    {
        $Request = Invoke-RestMethod -Headers $Header -Method Get -Uri 'https://api.todoist.com/rest/v1/labels' 
        
        $labels = @()
        
        foreach ($label in $Request)
        {
            try
            {
                $labels += $Label
            }
            catch
            {
                Write-Error $_
                
            }
        }
    }

    end
    {
        Return $labels
    }
    
}