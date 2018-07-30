---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# Update-TodoistComment

## SYNOPSIS
Updates a comment

## SYNTAX

```
Update-TodoistComment [-Id] <Int64> [-Content] <String> [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Updates a comment.
Only name supported in the current API (V8 beta) and not intendent etc.

## EXAMPLES

### EXAMPLE 1
```
Update-TodoistComment -Id 1234 -Name "My updated comment"
```

## PARAMETERS

### -Id
Id of the COMMENT

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

### -Content
Content of the comment.
Sorry, updating attachments not yet supported

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
