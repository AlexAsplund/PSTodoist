<#
.SYNOPSIS
    Updates a todoist task
.DESCRIPTION
    Updates a todoist task, alternate token can be supplied if Set-TodoistToken is not used
.EXAMPLE
    Update-TodoistTask -Id 1234 -Content "Put out forest fires" -DueString "In 2 years"
#>
Function Update-TodoistTask
{
    [CmdletBinding()]
    param(
        # ID of todoist Task
        [parameter(
            Mandatory = $True,
            ValueFromPipelineByPropertyName = $True
        )]
        [string]$Id,
        
        # Content (text) of task.
        [string]$Content,
        
        # LabelID or LabelIDs that the task should have (one int or array of ints)
        [int[]]$LabelIDs,

        # Priority of the task.
        [ValidatePattern('[0-4]')]
        [int]$Priority,

        # String with due date. "Tomorrow 4pm" etc. Can't be used with other Due* parameters (except DueLang)
        [string]$DueString,

        # String with due date. Format: yyyy-MM-dd (2018-07-20) . Can't be used with other Due* parameters (except DueLang)
        [string]$DueDate,

        # Specific date and time in RFC3339 format in UTC. Can't be used with other Due* parameters (except DueLang)
        [datetime]$DueDateTime,

        # 2-letter code specifying language in case DueString is not written in English.
        [string]$DueLang,

        # Id of the project that the task should be in
        [string]$ProjectID,

        # Todoist token if it's not set as a global variable with Set-TodoistToken
        [string]$Token = $Global:TodoistToken

    )
    begin
    {
        $Body = [PSCustomObject]@{}

        $Body | Add-Member -MemberType NoteProperty -Name "content" -Value $Content
    
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

        $Header = @{
            'Content-Type'  = "application/json"
            'X-Request-Id'  = [guid]::NewGuid().guid
            "Authorization" = "Bearer $($token)"
        }
        $Uri = "https://api.todoist.com/rest/v1/tasks/$Id"
    }

    process
    {
        $Response = Invoke-RestMethod -Uri $Uri -Headers $Header -Body ($Body) -Method Post -Verbose
    }

    end
    {
        Return $Response
    }
    
    
       
}