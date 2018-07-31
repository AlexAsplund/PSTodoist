# PSTodoist
## About PSTodoist
 A powershell module that uses the Todoist V8 BETA api.

 This module or author is NOT affiliated with TODOIST.

## Download

### Latest
https://github.com/AlexAsplund/PSTodoist/archive/master.zip

### v0.0.2
https://github.com/AlexAsplund/PSTodoist/archive/v0.0.2.zip

### v0.0.1
https://github.com/AlexAsplund/PSTodoist/archive/v0.0.1.zip


## Install
See [install](install.md)

## Help
 Refer to [the docs](docs/en-us/PSTodoist.md)

## Get API-token from todoist.
On the todoist website, go to: Todoist Settings -> Account -> API token.

## Usage
You can either set the todoist token with:

```Powershell
Set-TodoistToken -Token <YourToken>
```

Or supply it as a parameter on every command

```Powershell
Get-TodoistTask -Token <Yourtoken>
```

Example:

```Powershell
Set-TodoistToken -Token abcdef12345
Get-TodoistTask | Where-Object {$_.Content -Match "Do dishes"} | Update-TodoistTask -Content "Buy dishwasher"
```

## About the author
Author: https://github.com/AlexAsplund

Website: https://automativity.com



