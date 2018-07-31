---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# New-TodoistTask

## SYNOPSIS
Creates a new todoist task

## SYNTAX

```
New-TodoistTask [-Content] <String> [[-ProjectID] <String>] [[-LabelIDs] <Int32[]>] [[-Priority] <Int32>]
 [[-DueString] <String>] [[-DueDate] <String>] [[-DueDateTime] <DateTime>] [[-DueLang] <String>]
 [[-Token] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new todoist task, alternate token can be supplied if Set-TodoistToken is not used

## EXAMPLES

### EXAMPLE 1
```
New-TodoistTask -Content "Put out forest fires" -DueString "Tomorrow 4am"
```

## PARAMETERS

### -Content
Content (text) of the task

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProjectID
Project ID that the task should belong to

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LabelIDs
LabelID or LabelIDs that the task should have.
One or an array of INTs

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
Task priority

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueString
String with due date.
"Tomorrow 4pm" etc.
Can't be used with other Due* parameters (except DueLang)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDate
String with due date.
Format: yyyy-MM-dd (2018-07-20) .
Can't be used with other Due* parameters (except DueLang)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDateTime
Specific date and time in RFC3339 format in UTC.
Can't be used with other Due* parameters (except DueLang)

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueLang
2-letter code specifying language in case DueString is not written in English.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
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
Position: 9
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
