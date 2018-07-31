$files = ls $PSScriptRoot\src\Public\*

$Text = @"
# PSTodoist Module
## Description
A Powershell module for todoist.

This module is not affiliated with todoist!


"@

foreach($file in $files){

    $description = (cat $file.fullname)[2] + "`n"
    $cmdletname = $file.name -replace "\.ps1",""
    
    $NextRow = $False
    $Example = "`n"
    (cat $file.FullName) | foreach {
        if($NextRow){

            $Example += "`n$_"
            
            $NextRow = $false
            

        }
        if($_ -eq ".Example"){

            $NextRow = $True

        }


    }

    $Example += "`n"
    $Text+= "### [$cmdletname]($cmdletname.md)"
    $text += $Example+"`n"
    $text += $cmdletinfo
}

$Text | Out-File -FilePath $PSScriptRoot\docs\en-us\PSTodoist.md -Force



