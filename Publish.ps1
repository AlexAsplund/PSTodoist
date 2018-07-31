#Requires -Modules psake
Invoke-PSake $PSScriptRoot\build.psake.ps1 -taskList NewVersion,BeforeBuild,BeforeGenerateMarkdown,GenerateMarkdown,AfterGenerateMarkdown,Build