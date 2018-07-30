$moduleRoot = Resolve-Path "$PSScriptRoot\..\Release\PowershellTodoist"
$moduleName = Split-Path $moduleRoot -Leaf

Describe "Testing Get-TodoistTask for module $moduleName in $moduleRoot" {
    
    It "Module '$moduleName' can import cleanly" {
        {Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should Not Throw
    }
    
    It "Should have the global TodoistToken variable set" {
        $Global:TodoistToken | Should -Not -Be $null
    }

    It "Module '$moduleName' can import cleanly" {
        {Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should Not Throw
    }
    Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force -Verbose

    $Tasks = Get-TodoistTask
    It "Should get tasks" {
        $Tasks[0].Id | Should -Match "^\d+$"
    }

    It "Should be of type 'TodoistTask'" {
        $Tasks[0].GetType().name | Should -Be 'TodoistTask'
    }

}