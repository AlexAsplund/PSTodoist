<#
.SYNOPSIS
    Sets todoist token as a global variable
.DESCRIPTION
    Sets todoist token as a global variable (sorry)
    You can also use parameter -Token on all commands that needs a Token
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