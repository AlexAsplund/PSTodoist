<#
.SYNOPSIS
    Updates a label
.DESCRIPTION
    Updates a label.
    Only name supported in the current API (V8 beta) and not intendent etc.
    You must set either parameter Name, Token or both
.EXAMPLE
    Update-TodoistLabel -Id 1234 -Name "My updated label"
#>
function Update-TodoistLabel
{
    [CmdletBinding()]
    param (
        # ID of existing label
        [parameter(Mandatory)]
        [int64]$Id,

        # New name of label
        [string]$Name,

        # New order of label
        [int]$Order,

        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [string]$Token = $Global:TodoistToken
    )
    
    begin
    {
        if (($Order -eq $null) -and ($Name -eq $Null))
        {
            Write-Error "Parameter Order and Name is empty, set one or both of them"
            Break
        }

        Write-Verbose "Beginning create header"
        $Guid = [guid]::NewGuid().guid

        $Header = @{
            'Content-Type'  = "application/json"
            "Authorization" = "Bearer $($Token)"
            "X-Request-Id"  = $Guid
        }

        $Body = [PSCustomObject]@{}
        
        if (![string]::IsNullOrEmpty($Name))
        {
            $Body | Add-Member -MemberType NoteProperty -Name 'name' -Value $Name
        }
        
        if (![string]::IsNullOrEmpty($Order))
        {
            $Body | Add-Member -MemberType NoteProperty -Name 'order' -Value $Order
        }
        

        $Body = $Body | ConvertTo-Json

    }
    
    
    process
    {
        Write-Verbose "Updating label"
        $Uri = "https://beta.todoist.com/API/v8/labels/$Id"
        $Body
        $Response = Invoke-RestMethod -Uri $Uri -Headers $Header -Body ($Body) -Method Post
        Write-Verbose $Response
    }
    
    end
    {
        return $Header.'X-Request-Id'
    }
}