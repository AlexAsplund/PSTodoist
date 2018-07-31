# Installing PSTodoist


## Install latest release
```Powershell
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

    $ModulePath = "C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\"

    $Version = "0.0.1"



    if((Test-Path ".\PStodoist-$Version")) {

        Remove-Item ".\PStodoist-$Version" -Force -Recurse

    }

    Invoke-RestMethod -Uri "https://github.com/AlexAsplund/PSTodoist/archive/v$Version.zip" -OutFile ".\PStodoist-$Version.zip"

    if((Test-Path ".\PStodoist-$Version")) {

        Remove-Item ".\PStodoist-$Version" -recurse -force

    }


    Expand-Archive ".\PStodoist-$Version.zip" -DestinationPath .\

    If(!(Test-Path "$ModulePath\PSTodoist")) {

        New-Item -ItemType Directory -Path $ModulePath -Name 'PSTodoist'

    }

    If(!(Test-Path "$ModulePath\PSTodoist")) {

        Remove-Item "$ModulePath\PSTodoist\*" -Recurse -Force 

    }

    cp ".\PSTodoist-$Version\Release\PSTodoist\*" -Destination "$ModulePath\PSTodoist\" -Recurse -Force

```

## Install latest build

```Powershell
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

    $ModulePath = "C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\"

    $Version = "master"



    if((Test-Path ".\PStodoist-$Version")) {

        Remove-Item ".\PStodoist-$Version" -Force -Recurse

    }

    Invoke-RestMethod -Uri "https://github.com/AlexAsplund/PSTodoist/archive/master.zip" -OutFile ".\PStodoist-$Version.zip"

    if((Test-Path ".\PStodoist-$Version")) {

        Remove-Item ".\PStodoist-$Version" -recurse -force

    }


    Expand-Archive ".\PStodoist-$Version.zip" -DestinationPath ".\"
    If(!(Test-Path "$ModulePath\PSTodoist")) {

        New-Item -ItemType Directory -Path $ModulePath -Name 'PSTodoist'

    }

    If(!(Test-Path "$ModulePath\PSTodoist")) {

        Remove-Item "$ModulePath\PSTodoist\*" -Recurse -Force 

    }

    cp ".\PSTodoist-$Version\Release\PSTodoist\*" -Destination "$ModulePath\PSTodoist\" -Recurse -Force
```