<#
.SYNOPSIS
    Updates a project
.DESCRIPTION
    Updates a project.
    Only name supported in the current API (V8 beta) and not intendent etc.
.EXAMPLE
    Update-TodoistProject -Id 1234 -Name "My updated project"
#>
function Update-TodoistProject
{
    [CmdletBinding()]
    param (
        # Id of todoist project
        [parameter(Mandatory)]
        [int64]$Id,

        # New name of todoist project
        [parameter(Mandatory)]
        [string]$Name,

        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [string]$Token = $Global:TodoistToken
    )
    
    begin
    {
        
        Write-Verbose "Beginning create header"
        $Guid = [guid]::NewGuid().guid

        $Header = @{
            'Content-Type'  = "application/json"
            "Authorization" = "Bearer $($Token)"
            "X-Request-Id"  = $Guid
        }

        $Body = [PSCustomObject]@{}
        $Body | Add-Member -MemberType NoteProperty -Name 'name' -Value $Name

        $Body = $Body | ConvertTo-Json
    }
    
    process
    {
        Write-Verbose "Updating project"
        $Uri = "https://beta.todoist.com/API/v8/projects/$Id"
        $Response = Invoke-RestMethod -Uri $Uri -Headers $Header -Body ($Body) -Method Post
        Write-Verbose $Response
    }
    
    end
    {
        return $Header.'X-Request-Id'
    }
}