---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# New-TodoistProject

## SYNOPSIS
Creates a new project in todoist

## SYNTAX

```
New-TodoistProject [-Name] <Object> [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new project in todoist

## EXAMPLES

### EXAMPLE 1
```
New-TodoistProject -Name "My cool project"
```

## PARAMETERS

### -Name
New projects name

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
