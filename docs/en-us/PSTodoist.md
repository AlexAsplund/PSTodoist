# PSTodoist Module
## Description
A Powershell module for todoist.

This module is not affiliated with todoist!

### [Close-TodoistTask](Close-TodoistTask.md)

#### Description:

Closes a Todoist task

#### Example:

    Close-TodoistTask -Id 123456789
    Close-TodoistTask -Id 098765432,123466721
    Get-TodoistTask | ? {$_.Content -match "Stop Procrastinating"} | Close-TodoistTask

### [Get-TodoistComment](Get-TodoistComment.md)

#### Description:

Gets all comments for a project or task

#### Example:

    Get-TodoistComment -Id 1234 -Category "Task"
    Get-TodoistComment -Id 5678 -Category "Category"

### [Get-TodoistLabel](Get-TodoistLabel.md)

#### Description:

Gets all todoist labels

#### Example:

    Get-Todoistlabel
    Get-Todoistlabel -Token 1q2w3e4r5t6y7u8i99o0p
    $labels = Get-Todoistlabel | ? {$_.Content -match "My label"}

### [Get-TodoistProject](Get-TodoistProject.md)

#### Description:

Gets all open todoist projects

#### Example:

    Get-Todoistproject
    Get-Todoistproject -Token 1q2w3e4r5t6y7u8i99o0p
    $projects = Get-Todoistproject | ? {$_.Content -match "Do dishes"} | Remove-TodoistProject

### [Get-TodoistTask](Get-TodoistTask.md)

#### Description:

Gets all open todoist tasks and gives them back in [TodoistTask] type form

#### Example:

    Get-TodoistTask
    Get-TodoistTask -Token 1q2w3e4r5t6y7u8i99o0p
    $Tasks = Get-TodoistTask | ? {$_.Content -match "dishes"}

### [New-TodoistComment](New-TodoistComment.md)

#### Description:

Creates a new comment for a project or task

#### Example:

    New-TodoistComment -Id 1234 -Content "Customer contacted"
    New-TodoistComment -Id 1234 -Content "New report" -Category Task -Verbose -AddAttachment -AttachmentResourceType "file" -AttachmentFileType "application/pdf" -AttachmentFileUrl "http://www.orimi.com/pdf-test.pdf" -AttachmentFileName "file.pdf"

### [New-TodoistLabel](New-TodoistLabel.md)

#### Description:

Creates a new label in todoist

#### Example:

    New-TodoistLabel -Name "My cool label"

### [New-TodoistProject](New-TodoistProject.md)

#### Description:

Creates a new project in todoist

#### Example:

    New-TodoistProject -Name "My cool project"

### [New-TodoistTask](New-TodoistTask.md)

#### Description:

Creates a new todoist task

#### Example:

    New-TodoistTask -Content "Put out forest fires" -DueString "Tomorrow 4am"

### [Open-TodoistTask](Open-TodoistTask.md)

#### Description:

Opens a previously closed Todoist task

#### Example:

    Open-TodoistTask -Id 123456789
    Open-TodoistTask -Id 098765432,123466721
    Get-TodoistTask | ? {$_.Content -match "Start Procrastinating"} | Open-TodoistTask

### [Remove-TodoistComment](Remove-TodoistComment.md)

#### Description:

Removes a Todoist comment

#### Example:

    Remove-TodoistComment -Id 123456789
    Remove-TodoistComment -Id 098765432,123466721
    Get-TodoistComment | ? {$_.Content -match "Big"} | Remove-TodoistComment

### [Remove-TodoistLabel](Remove-TodoistLabel.md)

#### Description:

Removes a Todoist label

#### Example:

    Remove-TodoistLabel -Id 123456789
    Remove-TodoistLabel -Id 098765432,123466721
    Get-TodoistLabel | ? {$_.Content -match "Big"} | Remove-TodoistLabel

### [Remove-TodoistProject](Remove-TodoistProject.md)

#### Description:

Removes a Todoist project

#### Example:

    Remove-TodoistProject -Id 123456789
    Remove-TodoistProject -Id 098765432,123466721
    Get-TodoistProject | ? {$_.Content -match "Big"} | Remove-TodoistProject

### [Remove-TodoistTask](Remove-TodoistTask.md)

#### Description:

Removes a Todoist task

#### Example:

    Remove-TodoistTask -Id 123456789
    Remove-TodoistTask -Id 098765432,123466721
    Get-TodoistTask | ? {$_.Content -match "Stop Procrastinating"} | Remove-TodoistTask

### [Set-TodoistToken](Set-TodoistToken.md)

#### Description:

Sets todoist token as a global variable

#### Example:

    Set-TodoistToken 1q2w3e434rt56y7ui8o09

### [Update-TodoistComment](Update-TodoistComment.md)

#### Description:

Updates a comment

#### Example:

    Update-TodoistComment -Id 1234 -Name "My updated comment"

### [Update-TodoistLabel](Update-TodoistLabel.md)

#### Description:

Updates a label

#### Example:

    Update-TodoistLabel -Id 1234 -Name "My updated label"

### [Update-TodoistProject](Update-TodoistProject.md)

#### Description:

Updates a project

#### Example:

    Update-TodoistProject -Id 1234 -Name "My updated project"

### [Update-TodoistTask](Update-TodoistTask.md)

#### Description:

Updates a todoist task

#### Example:

    Update-TodoistTask -Id 1234 -Content "Put out forest fires" -DueString "In 2 years"


