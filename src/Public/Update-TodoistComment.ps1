<#
.SYNOPSIS
    Updates a comment
.DESCRIPTION
    Updates a comment.
    Only name supported in the current API (V8 beta) and not intendent etc.
.EXAMPLE
    Update-TodoistComment -Id 1234 -Name "My updated comment"
#>
function Update-TodoistComment
{
    [CmdletBinding()]
    param (
        # Id of the COMMENT
        [parameter(Mandatory)]
        [int64]$Id,
        [parameter(Mandatory)]

        # Content of the comment. Sorry, updating attachments not yet supported
        [string]$Content,
        
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
        $Body | Add-Member -MemberType NoteProperty -Name 'content' -Value $Content

        $Body = $Body | ConvertTo-Json
    }
    
    process
    {
        Write-Verbose "Updating comment"
        $Uri = "https://beta.todoist.com/API/v8/comments/$Id"
        $Response = Invoke-RestMethod -Uri $Uri -Headers $Header -Body ($Body) -Method Post
        Write-Verbose $Response
    }
    
    end
    {
        return $Header.'X-Request-Id'
    }
}