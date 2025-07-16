## install

Open a PowerShell terminal (version 5.1 or later) and from the PS C:\> prompt, run:

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

## import scoopfile

```
scoop import ~\repos\win-config\scoop\ScoopFile.json
```

## export scoopfile

```
scoop export > ~\repos\win-config\scoop\ScoopFile.json
```
