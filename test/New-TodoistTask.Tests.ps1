$moduleRoot = Resolve-Path "$PSScriptRoot\..\Release\PowershellTodoist"
$moduleName = Split-Path $moduleRoot -Leaf

$RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
$RandomString = 'Pester Test for Todoist ' + $RandomString

Describe "Testing New-TodoistTask for module $moduleName in $moduleRoot" {

    
    It "Module '$moduleName' can import cleanly" {
        {Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should Not Throw
    }

    It "Should have the global TodoistToken variable set" {
        $Global:TodoistToken | Should -Not -Be $null
    }

    It "Should be able to create a task and return a GUID" {
        
        Write-Output $RandomString
        New-TodoistTask -Content $RandomString -DueString "Tomorrow 10pm" | Should -Match '[a-z\d]+-[a-z\d]+-[a-z\d]+-[a-z\d]+-[a-z\d]+'
        
    }

    $Task = (Get-TodoistTask | Where-Object {$_.content -eq $RandomString})

    It "Should be able to retrive the task it created" {

        $Task.content | Should -Be $RandomString

    }

    It "Should have a due string of 'Tomorrow 10pm'" {
        $Task.Due.string | Should -Be 'Tomorrow 10pm'
    }

    It "Should be able to be removed by class method" {
        $Task = (Get-TodoistTask | Where-Object {$_.content -eq $RandomString})
        {$Task.Remove()} | Should Not Throw
    }

    

    It "Task should not exist anymore" {
        (Get-TodoistTask | Where-Object {$_.content -eq $RandomString}) | Should -Be $null
    }

}