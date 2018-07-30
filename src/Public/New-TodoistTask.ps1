<#
.SYNOPSIS
    Creates a new todoist task
.DESCRIPTION
    Creates a new todoist task, alternate token can be supplied if Set-TodoistToken is not used
.EXAMPLE
    New-TodoistTask -Content "Put out forest fires" -DueString "Tomorrow 4am"
#>
function New-TodoistTask
{
    [CmdletBinding()]
    param(
        # Content (text) of the task
        [parameter(Mandatory)]
        [string]$Content,
        
        # Project ID that the task should belong to
        [string]$ProjectID,

        # LabelID or LabelIDs that the task should have. One or an array of INTs 
        [int[]]$LabelIDs,

        # Task priority
        [ValidatePattern('[1-4]')]
        [int]$Priority,

        # String with due date. "Tomorrow 4pm" etc. Can't be used with other Due* parameters (except DueLang)
        [string]$DueString,

        # String with due date. Format: yyyy-MM-dd (2018-07-20) . Can't be used with other Due* parameters (except DueLang)
        [string]$DueDate,

        # Specific date and time in RFC3339 format in UTC. Can't be used with other Due* parameters (except DueLang)
        [datetime]$DueDateTime,

        # 2-letter code specifying language in case DueString is not written in English.
        [string]$DueLang,

        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [string]$Token = $Global:TodoistToken

    )

    begin
    {
        
        $Body = [PSCustomObject]@{}
    
        if (![string]::IsNullOrEmpty($Content))
        {
            $Body | Add-Member -MemberType NoteProperty -Name "content" -Value $Content
        }

        if ($LabelIDs -ne $null)
        {
            $Body | Add-Member -MemberType NoteProperty -Name "label_ids" -Value $LabelIDs
        }

        if ($Priority -ne $null)
        {
            $Body | Add-Member -MemberType NoteProperty -Name "priority" -Value $Priority
        }

        if (![string]::IsNullOrEmpty($DueString))
        {
            $Body | Add-Member -MemberType NoteProperty -Name "due_string" -Value $DueString
        }

        if (![string]::IsNullOrEmpty($DueDate))
        {
            $Body | Add-Member -MemberType NoteProperty -Name "due_date" -Value $DueDate
        }

        if (![string]::IsNullOrEmpty($DueDateTime))
        {
            $Body | Add-Member -MemberType NoteProperty -Name "due_datetime" -Value $DueDateTime
        }

        if (![string]::IsNullOrEmpty($DueLang))
        {
            $Body | Add-Member -MemberType NoteProperty -Name "due_lang" -Value $DueLang
        }

        if (![string]::IsNullOrEmpty($ProjectID))
        {
            $Body | Add-Member -MemberType NoteProperty -Name "project_id" -Value $ProjectID
        }
    
        $Body = $Body | ConvertTo-Json
    }

    process
    {
        $Header = @{
            'Content-Type'  = "application/json"
            'X-Request-Id'  = [guid]::NewGuid().guid
            "Authorization" = "Bearer $($Token)"
        }
        $Uri = "https://beta.todoist.com/API/v8/tasks"
        $Response = Invoke-RestMethod -Uri $Uri -Headers $Header -Body ($Body) -Method Post
        Write-Verbose $Response
    }

    end
    {
        return $Header.'X-Request-Id'
    }
}