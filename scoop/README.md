## install

Open a PowerShell terminal (version 5.1 or later) and from the PS C:\> prompt, run:

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## setup aria2

```
scoop install aria2
scoop config aria2-max-connection-per-server 16
scoop config aria2-split 16
scoop config aria2-min-split-size 1M
scoop config aria2-warning-enabled false
```

## import scoopfile

```
scoop import ~\repos\win-config\scoop\ScoopFile.json
```

## export scoopfile

```
scoop export > ~\repos\win-config\scoop\ScoopFile.json
```
