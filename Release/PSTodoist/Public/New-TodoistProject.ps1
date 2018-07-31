<#
.SYNOPSIS
    Creates a new project in todoist
.DESCRIPTION
    Creates a new project in todoist
.EXAMPLE
    New-TodoistProject -Name "My cool project"
#>
function New-TodoistProject
{
    [CmdletBinding()]
    param (
        # Name of the new project
        [parameter(Mandatory)]
        $Name,
        
        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [String]$Token = $Global:TodoistToken
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
        $Body | Add-Member -MemberType NoteProperty -Name 'Name' -Value $Name

        $Body = $Body | ConvertTo-Json
    }
    
    process
    {
        Write-Verbose "Creating project"
        $Uri = "https://beta.todoist.com/API/v8/projects"
        $Response = Invoke-RestMethod -Uri $Uri -Headers $Header -Body ($Body) -Method Post
        Write-Verbose $Response
    }
    
    end
    {
        return $Header.'X-Request-Id'
    }
}