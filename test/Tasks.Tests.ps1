$moduleRoot = Resolve-Path "$PSScriptRoot\..\Release\PSTodoist"
$moduleName = Split-Path $moduleRoot -Leaf

$RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
$RandomString = 'Pester Test for Todoist ' + $RandomString

Describe "Testing  module $moduleName in $moduleRoot" {


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
    
    It "Should be able to close task without error" {
        
        (Close-TodoistTask -Id $Task.id) | Should -Not -Be $Null
    }

    It "Task should no longer be retrived with Get-TodoistTask" {
        
        Get-TodoistTask | Where-Object {$_.Id -eq $Task.Id} | Should -Be $null
    }

    It "Should be able to reopen task without errors" {
        (Open-TodoistTask -Id $Task.id) | Should -Not -Be $Null
    }
    $NewTodoistTask = (Get-TodoistTask | Where-Object {$_.Id -eq $Task.Id})
    It "Task should be retrived with Get-TodoistTask" {
        $NewTodoistTask.Id | Should -Be $Task.Id
    }

    $RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
    $NewRandomString = 'Pester Test for Todoist ' + $RandomString

    It "Should be able to update task with Update-TodoistTask" {
        
        Update-TodoistTask -Id $Task.Id -Content $NewRandomString | Should -Not -Be $Null
    }

    It "Task content should be updated" {
        (Get-TodoistTask | Where-Object {$_.Id -eq $Task.Id}).Content | Should -Be $NewRandomString
    }

    It "Should be able to remove task" {
        (Remove-TodoistTask -Id $Task.id) | Should -Not -Be $Null
    }

    It "Task should no longer be retrived with Get-TodoistTask" {
        Get-TodoistTask | Where-Object {$_.Id -eq $Task.Id} | Should -Be $null
    }

}