param(

    [switch]$Debug

)
$files = ls $PSScriptRoot\src\Public\*

$Text = @"
# PSTodoist Module
## Description
A Powershell module for todoist.

This module is not affiliated with todoist!


"@

foreach($file in $files){

    $description = ((cat $file.fullname)[2] + "`n") -replace "^\s+",""
    $cmdletname = $file.name -replace "\.ps1",""
    
    $NextRowIsExample = $False
    $NextRowIsDescription = $False
    $Example = "`n"

    $Descr = ""

    (cat $file.FullName) | foreach {
        if($NextRowIsExample){

            $Example += "`n$_"
            
            $NextRowIsExample = $false
            

        }

        if($_ -eq ".Example"){

            $NextRowIsExample = $True

        }

    }

    $Example += "`n"
    $Text+= "### [$cmdletname]($cmdletname.md)"
    $Text += "`n`nDescription:`n`n"
    $Text += "$Description"
    $Text += "`nExample:"
    $text += $Example+"`n"
    $text += $cmdletinfo
}

if(!$Debug) {
    $Text | Out-File -FilePath $PSScriptRoot\docs\en-us\PSTodoist.md -Force
}
else {
    $Text
}



