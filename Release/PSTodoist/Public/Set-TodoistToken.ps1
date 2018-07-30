<#
.SYNOPSIS
    Sets todoist token as a global variable
.EXAMPLE
    Set-TodoistToken 1q2w3e434rt56y7ui8o09
#>
Function Set-TodoistToken
{
    param(
        # Todoist token
        $Token
    )
    
    $Global:TodoistToken = $Token
}