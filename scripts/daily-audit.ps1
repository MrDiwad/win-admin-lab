$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$disk = Get-PSDrive C | select @{Name="Free_GB"; Expression={[math]::Round($_.Free/1GB, 2)}}
$Users = Get-ADUser -Filter * | select Name, Enabled

$Report = @"

############################################
Server Report DC01 - $date
############################################
Free space on disk C: $($disk.Free_GB) GB

Active Users on AD:
$($Users | Out-String)

############################################
"@

$Report | Out-File -FilePath "C:\AdminLab\daily-report.txt" -Encoding utf8
```[cite: 1]
