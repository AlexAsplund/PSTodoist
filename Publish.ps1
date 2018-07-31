#Requires -Modules psake
Invoke-PSake $PSScriptRoot\build.psake.ps1 -taskList VersionDir,BeforeBuild,GenerateMarkdown,Build