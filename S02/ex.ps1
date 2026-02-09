
Get-Acl .\test.ps1
Get-Acl .\test.ps1 | Where-Object owner -eq "CLIM\$env:USERNAME" | select AccessToString