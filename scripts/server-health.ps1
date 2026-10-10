hostname
gsv | Measure-Object
gsv -DisplayName "*desktop*" | where Status -eq "Running"
ps | sort WS -desc | select -First 3
