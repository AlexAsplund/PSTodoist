#Requires -Modules psake
Invoke-PSake $PSScriptRoot\build.psake.ps1 -taskList BeforeBuild,GenerateMarkdown,Build,NewVersionDir