---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# Get-TodoistTask

## SYNOPSIS
Gets all open todoist tasks and gives them back in \[TodoistTask\] type form

## SYNTAX

```
Get-TodoistTask [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets all open todoist tasks and gives them back in \[TodoistTask\] type form.
The output can later on be used for running class methods for easy administration.

## EXAMPLES

### EXAMPLE 1
```
Get-TodoistTask
```

### EXAMPLE 2
```
Get-TodoistTask -Token 1q2w3e4r5t6y7u8i99o0p
```

### EXAMPLE 3
```
$Tasks = Get-TodoistTask | ? {$_.Content -match "dishes"}
```

$Tasks.Close()

## PARAMETERS

### -Token
Todoist token if it's not set as a global variable with Set-TodoistToken

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $Global:TodoistToken
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
