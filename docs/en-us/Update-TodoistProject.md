---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# Update-TodoistProject

## SYNOPSIS
Updates a project

## SYNTAX

```
Update-TodoistProject [-Id] <Int64> [-Name] <String> [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Updates a project.
Only name supported in the current API (V8 beta) and not intendent etc.

## EXAMPLES

### EXAMPLE 1
```
Update-TodoistProject -Id 1234 -Name "My updated project"
```

## PARAMETERS

### -Id
Id of existing project

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
New name of project

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
Todoist token if it's not set as a global variable with Set-TodoistToken

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
