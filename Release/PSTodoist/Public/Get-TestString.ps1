<#
.SYNOPSIS
    Returns the string you input, placeholder for plaster import
.DESCRIPTION
    Returns the string you input, placeholder for plaster import
.EXAMPLE
    Get-Teststring -TestString "HELLO!"
 .NOTES
    Placeholder for plaster
#>
function Get-TestString
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([string])]
    Param
    (
        # Input a string and the  function returns the same string
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
		[string]$TestString


    )

    Begin
    {
    }
    Process
    {
    }
    End
    {
		return $teststring
    }
}
