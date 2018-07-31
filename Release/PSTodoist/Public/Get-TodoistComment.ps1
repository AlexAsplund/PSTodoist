<#
.SYNOPSIS
    Gets all comments for a project or task
.DESCRIPTION
    Gets all comments for a project or task. Selection if Id is for a project or task is done through parameter "category"
.EXAMPLE
    Get-TodoistComment -Id 1234 -Category "Task"
.EXAMPLE
    Get-TodoistComment -Id 5678 -Category "Category"
#>
function Get-TodoistComment
{
    [CmdletBinding()]
    param (
        # Id of todoist comment
        [parameter(ValueFromPipelineByPropertyName, Mandatory = $True)]
        [int64]$Id,

        # Category of ID (either task or project)
        [parameter(Mandatory)]
        [ValidateSet("Project", "Task")]
        [String]$Category,
        
        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [string]$Token = $Global:TodoistToken
    )
    
    begin
    {

        $Category = $Category.ToLower()

        Write-Verbose "Beginning to fetch comments for $Category $Id"
        
        $Header = @{
            'Content-Type'  = "application/json"
            "Authorization" = "Bearer $($Token)"
        }

    }
    
    process
    {
        $Uri = ("https://beta.todoist.com/API/v8/comments?" + $Category + "_id=" + $Id)
        Write-Verbose $Uri
        $Request = Invoke-RestMethod -Headers $Header -Method Get -Uri $Uri
        
        $Comments = @()
        
        foreach ($Comment in $Request)
        {
            try
            {
                $Comments += $Comment
            }
            catch
            {
                Write-Error $_
                
            }
        }
    }
    
    end
    {
        Return $Comments
    }
}