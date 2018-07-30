Class TodoistTask {
    [int64]$Id
    [int64]$ProjectID
    [string]$Content
    [Array]$due
    [Array]$LabelIDs
    [System.Collections.ArrayList]$Labels
    [int32]$Comment_Count
    [int32]$Order
    [int32]$Indent
    [int32]$Priority
    [string]$Url
    
    hidden [Array]$Output
    
    TodoistTask($Item) {
        $this.Id = $item.Id
        $this.ProjectID = $item.project_id
        $this.Content = $item.content
        if ($item.comment_count) {
            $this.CommentCount = $item.comment_count
        }

        if ($item.due -ne $null) {
            $this.due = $item.due
        }
        
        $item.label_ids | foreach {$this.LabelIDs += [string]$_}
        
        
        $this.Order = $item.order
        $this.Indent = $item.indent
        $this.Priority = $item.priority
        $this.Url = $item.url
    }
    close() {
        Close-TodoistTask -Id $this.Id
    }
    open() {
        Open-TodoistTask -Id $this.Id
    }
    remove() {
        Remove-TodoistTask -Id $this.Id
    }
    update() {    
        Update-TodoistTask -Id $this.Id -Content $this.Content -Priority $this.Priority -ProjectID $this.ProjectID -LabelIDs $this.LabelIDs
    }
    updatewithduestring($DueString) {
        Update-TodoistTask -Id $this.Id -Content $this.Content -Priority $this.Priority -ProjectID $this.ProjectID -LabelIDs $this.LabelIDs -DueString $DueString
    }
    refresh() {
        $task = Get-TodoistTask | ? {$_.Id -eq $this.id}
        $this = $task
    }
    
}