---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# New-TodoistLabel

## SYNOPSIS
Creates a new label in todoist

## SYNTAX

```
New-TodoistLabel [-Name] <Object> [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new label in todoist
Only name supported during creation of label in V8 beta API.
If you want to set order, see Update-TodoistLabel

## EXAMPLES

### EXAMPLE 1
```
New-TodoistLabel -Name "My cool label"
```

## PARAMETERS

### -Name
New name of label

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
