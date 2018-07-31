#Requires -Modules psake
Invoke-PSake $PSScriptRoot\build.psake.ps1 -taskList Version,BeforeBuild,BeforeGenerateMarkdown,GenerateMarkdown,AfterGenerateMarkdown,Build