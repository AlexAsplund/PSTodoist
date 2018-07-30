---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# Remove-TodoistTask

## SYNOPSIS
Removes a Todoist task

## SYNTAX

```
Remove-TodoistTask [-Id] <Int64[]> [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Removes a Todoist task, can either be via array or INT array.
Can also be supplied through pipeline

## EXAMPLES

### EXAMPLE 1
```
Remove-TodoistTask -Id 123456789
```

### EXAMPLE 2
```
Remove-TodoistTask -Id 098765432,123466721
```

### EXAMPLE 3
```
Get-TodoistTask | ? {$_.Content -match "Stop Procrastinating"} | Remove-TodoistTask
```

## PARAMETERS

### -Id
Id of todoist task

```yaml
Type: Int64[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Token
Todoist token if it's not set as a global variable with Set-TodoistToken

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $Global:TodoistToken
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
