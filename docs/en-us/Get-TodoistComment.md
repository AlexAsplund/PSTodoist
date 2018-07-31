---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# Get-TodoistComment

## SYNOPSIS
Gets all comments for a project or task

## SYNTAX

```
Get-TodoistComment [-Id] <Int64> [-Category] <String> [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets all comments for a project or task.
Selection if Id is for a project or task is done through parameter "category"

## EXAMPLES

### EXAMPLE 1
```
Get-TodoistComment -Id 1234 -Category "Task"
```

### EXAMPLE 2
```
Get-TodoistComment -Id 5678 -Category "Category"
```

## PARAMETERS

### -Id
{{Fill Id Description}}

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Category
{{Fill Category Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
{{Fill Token Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $Global:TodoistToken
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
