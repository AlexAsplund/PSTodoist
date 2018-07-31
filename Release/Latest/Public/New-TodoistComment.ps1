<#
.SYNOPSIS
    Creates a new comment for a project or task
.DESCRIPTION
    Creates a new comment for a project or task. Selection if Id is for a project or task is done through parameter "category"
.EXAMPLE
    New-TodoistComment -Id 1234 -Content "Customer contacted"
.EXAMPLE
    New-TodoistComment -Id 1234 -Content "New report" -Category Task -Verbose -AddAttachment -AttachmentResourceType "file" -AttachmentFileType "application/pdf" -AttachmentFileUrl "http://www.orimi.com/pdf-test.pdf" -AttachmentFileName "file.pdf"
#>
function New-TodoistComment
{
    [CmdletBinding()]
    param (
        # Id of the task or project
        [parameter(ValueFromPipelineByPropertyName, Mandatory = $True)]
        [parameter(ParameterSetName = 'set1')]
        [int64]$Id,
        
        # Select if it's a task or project. STRING. Either 'Task' or 'Project'
        [parameter(Mandatory)]
        [parameter(ParameterSetName = 'set1')]
        [ValidateSet("Project", "Task")]
        [String]$Category,

        # Content of the comment
        [parameter(Mandatory)]
        [parameter(ParameterSetName = 'set1')]
        [String]$Content,
        
        # Switch statement if you want to attatch a file
        [parameter(ParameterSetName = 'attachment', Mandatory = $false)]
        [parameter(ParameterSetName = 'set1', Mandatory = $False)]
        [switch]$AddAttachment,

        # Attatchment resource type, Example: "file"
        [parameter(ParameterSetName = 'attachment', Mandatory = $True)]
        [parameter(ParameterSetName = 'set1', Mandatory = $False)]
        [string]$AttachmentResourceType,
        
        # Attachment file type. "application/pdf" or "application/image" etc 
        [parameter(ParameterSetName = 'attachment', Mandatory = $True)]
        [parameter(ParameterSetName = 'set1', Mandatory = $False)]
        $AttachmentFileType,
        
        # Url to file. Sorry, the todoist api does not support uploading files yet.
        [parameter(ParameterSetName = 'attachment', Mandatory = $True)]
        [parameter(ParameterSetName = 'set1', Mandatory = $False)]
        [string]$AttachmentFileUrl,
        
        # Filename that you want the file to have. "New report.pdf" etc
        [parameter(ParameterSetName = 'attachment', Mandatory = $True)]
        [parameter(ParameterSetName = 'set1', Mandatory = $False)]
        [string]$AttachmentFileName,

        # Manually supplied todoist token if you dont want to set it with Set-TodoistToken
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

        $Body = [PSCustomObject]@{}

        $Body | Add-Member -MemberType NoteProperty -Name ($Category + "_id") -Value $Id
        $Body | Add-Member -MemberType NoteProperty -Name 'content' -Value $Content

        if (![string]::IsNullOrEmpty($AttachmentResourceType))
        {
            $Attachment = [PSCustomObject]@{}
            $Attachment | Add-Member -MemberType NoteProperty -Name 'resource_type' -Value $AttachmentResourceType
            $Attachment | Add-Member -MemberType NoteProperty -Name 'file_url' -Value $AttachmentFileUrl
            $Attachment | Add-Member -MemberType NoteProperty -Name 'file_type' -Value $AttachmentFileType
            $Attachment | Add-Member -MemberType NoteProperty -Name 'file_name' -Value $AttachmentFileName
            $Body | Add-Member -MemberType NoteProperty -Name 'attachment' -Value $Attachment
        }
        
        $Body = $Body | ConvertTo-Json
    }
    
    process
    {
        $Uri = ("https://beta.todoist.com/API/v8/comments")
        Write-Verbose $Uri
        $Request = Invoke-RestMethod -Headers $Header -Method Post -Uri $Uri -Body $Body
        
        
    }
    
    end
    {
        Return $Request
    }
}