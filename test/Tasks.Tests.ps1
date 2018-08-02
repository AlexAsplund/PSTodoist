$moduleRoot = Resolve-Path "$PSScriptRoot\..\Release\PSTodoist"
$moduleName = Split-Path $moduleRoot -Leaf

$RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
$RandomString = 'Pester Test for Todoist ' + $RandomString

Describe "Testing  module $moduleName in $moduleRoot" {

    context "Testing Task specifik cmdlets" {
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

    context "Testing Comment specific cmdlets" {

        $RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
        $RandomCommentString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
        $RandomString = 'Pester Test for Todoist ' + $RandomCommentString

        It "Should be able to create a task and return a GUID" {
            
            Write-Output $RandomString
            New-TodoistTask -Content $RandomString -DueString "Tomorrow 10pm" | Should -Match '[a-z\d]+-[a-z\d]+-[a-z\d]+-[a-z\d]+-[a-z\d]+'
            
        }

        $Task = (Get-TodoistTask | Where-Object {$_.content -eq $RandomString})

        It "Should be able to create a comment" {
            New-TodoistComment -Id $Task.Id -Category Task -Content $RandomString
        }
        
        It "Should be able to fetch comment" {
            
            (Get-TodoistComment -Id $Task.Id -Category Task).content | Should -Be $RandomString
        }

        $Comment = (Get-TodoistComment -Id $Task.Id -Category Task)[0]    

        It "Should be able to delete that comment" {
            Remove-TodoistComment -Id $Comment.Id 
        }

        It "Should not be able to fetch comment" {
            
            (Get-TodoistComment -Id $Task.Id -Category Task).content | Should -Be $null
        }

        It "Should be able to remove task" {
            (Remove-TodoistTask -Id $Task.id) | Should -Not -Be $Null
        }

    }

    Context "Testing Project Related cmdlets" {

        $RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
        $RandomCommentString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""

        It "Should be able to create a new project" {
            New-TodoistProject -Name $RandomString | Should -Not -Be $Null
        }
        
        It "Should be able to fetch projects" {
            
            Get-TodoistProject | Should -Not -Be $Null

        }

        $Project = Get-TodoistProject | Where-Object {$_.Name -eq $RandomString}

        It "Should be able to add a new comment to that project" {
            New-TodoistComment -Id $Project.Id -Category Project -Content $RandomString  | Should -Not -Be $Null
        }

        It "Should be able to fetch comment" {
            
            (Get-TodoistComment -Id $Project.Id -Category Project).content | Should -Be $RandomString
        }
        $Comment = (Get-TodoistComment -Id $Project.Id -Category Project)[0]    

        $RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""

        It "Should be able to update that comment" {
            Update-TodoistComment -Id $Comment.Id -Content $RandomString | Should -Not -Be $null
        }

        It "Should be able to delete that comment" {
            Remove-TodoistComment -Id $Comment.Id 
        }

        It "Should not be able to fetch comment" {
            
            (Get-TodoistComment -Id $Project.Id -Category Project).content | Should -Be $null
        }

        It "Should be able to remove project" {
            Remove-TodoistProject -Id $Project.Id | Should -Not -Be $Null
        }
        
        It "Project should no longer exist" {
            
            Get-TodoistProject | Where-Object {$_.Name -eq $RandomString} | Should -Be $null
        
        }
    }

    Context "Testing label specific cmdlets" {

        $RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""

        It "Should be able to create a label" {
            
            New-TodoistLabel -Name $RandomString | Should -Not -Be $Null
        
        }

        It "Should be able to fetch the new label" {
            Get-TodoistLabel | ? {$_.Name -eq $RandomString} | Should -Not -Be $null
        }

        $Label = Get-TodoistLabel | ? {$_.Name -eq $RandomString} 
        $RandomString = (('abcdefghijklmnopqrstuvxyz1234567890' -split '')[1..35]  | Get-Random -Count 20) -join ""
        
        It "Should be able to update that label" {
            Update-TodoistLabel -Id $Label.Id -Name $RandomString | Should -Not -Be $null
        }

        It "Should be able to fetch the updated label" {

            Get-TodoistLabel | ? {$_.Name -eq $RandomString} | Should -Not -Be $null

        }

        It "Should be able to remove the label" {
            
            Remove-TodoistLabel -Id $Label.Id | Should -Not -Be $Null
        
        }

        It "Should not be able to fetch the new label" {
        
            Get-TodoistLabel | Where-Object {$_.Name -eq $RandomString} | Should -Be $null
        
        }
        
    }

    
}