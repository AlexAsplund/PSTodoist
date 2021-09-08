<#
.SYNOPSIS
    Creates a new label in todoist
.DESCRIPTION
    Creates a new label in todoist
    Only name supported during creation of label in V8 beta API.
    If you want to set order, see Update-TodoistLabel
.EXAMPLE
    New-TodoistLabel -Name "My cool label"
#>
function New-TodoistLabel
{
    [CmdletBinding()]
    param (
        # New name of label
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
        Write-Verbose "Creating label"
        $Uri = "https://api.todoist.com/rest/v1/labels"
        $Response = Invoke-RestMethod -Uri $Uri -Headers $Header -Body ($Body) -Method Post
        Write-Verbose $Response
    }
    
    end
    {
        return $Header.'X-Request-Id'
    }
}