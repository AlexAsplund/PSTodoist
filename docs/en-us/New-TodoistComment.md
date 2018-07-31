---
external help file: PSTodoist-help.xml
Module Name: PSTodoist
online version:
schema: 2.0.0
---

# New-TodoistComment

## SYNOPSIS
Creates a new comment for a project or task

## SYNTAX

### set1
```
New-TodoistComment [-Id <Int64>] [-Category <String>] [-Content <String>] [-AddAttachment]
 [-AttachmentResourceType <String>] [-AttachmentFileType <Object>] [-AttachmentFileUrl <String>]
 [-AttachmentFileName <String>] [-Token <String>] [<CommonParameters>]
```

### attachment
```
New-TodoistComment -Id <Int64> -Category <String> -Content <String> [-AddAttachment]
 -AttachmentResourceType <String> -AttachmentFileType <Object> -AttachmentFileUrl <String>
 -AttachmentFileName <String> [-Token <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a new comment for a project or task.
Selection if Id is for a project or task is done through parameter "category"

## EXAMPLES

### EXAMPLE 1
```
New-TodoistComment -Id 1234 -Content "Customer contacted"
```

### EXAMPLE 2
```
New-TodoistComment -Id 1234 -Content "New report" -Category Task -Verbose -AddAttachment -AttachmentResourceType "file" -AttachmentFileType "application/pdf" -AttachmentFileUrl "http://www.orimi.com/pdf-test.pdf" -AttachmentFileName "file.pdf"
```

## PARAMETERS

### -Id
Id of the task or project

```yaml
Type: Int64
Parameter Sets: set1
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: Int64
Parameter Sets: attachment
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
Select if it's a task or project.
STRING.
Either 'Task' or 'Project'

```yaml
Type: String
Parameter Sets: set1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: attachment
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Content
Content of the comment

```yaml
Type: String
Parameter Sets: set1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: attachment
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AddAttachment
Switch statement if you want to attatch a file

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AttachmentResourceType
Attatchment resource type, Example: "file"

```yaml
Type: String
Parameter Sets: set1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: attachment
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AttachmentFileType
Attachment file type.
"application/pdf" or "application/image" etc

```yaml
Type: Object
Parameter Sets: set1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: Object
Parameter Sets: attachment
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AttachmentFileUrl
Url to file.
Sorry, the todoist api does not support uploading files yet.

```yaml
Type: String
Parameter Sets: set1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: attachment
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AttachmentFileName
Filename that you want the file to have.
"New report.pdf" etc

```yaml
Type: String
Parameter Sets: set1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: attachment
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
Manually supplied todoist token if you dont want to set it with Set-TodoistToken

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
