---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# Get-TodoistProject

## SYNOPSIS
Gets all open todoist projects

## SYNTAX

```
Get-TodoistProject [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets all open todoist projects

## EXAMPLES

### EXAMPLE 1
```
Get-Todoistproject
```

### EXAMPLE 2
```
Get-Todoistproject -Token 1q2w3e4r5t6y7u8i99o0p
```

### EXAMPLE 3
```
$projects = Get-Todoistproject | ? {$_.Content -match "Do dishes"} | Remove-TodoistProject
```

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
