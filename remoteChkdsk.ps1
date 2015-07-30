<#
20150716 dc v1.0 Splunk Alert Remediation Script Skeleton
20150721 dc v1.1 Run remotechkdsk

dchow[AT]xtecsystems.com
https://github.com/dc401
#>

#pass splunk alert result gzip file path
$a = $args[8]
#add quotes because windows is stupid with spaces
$b = '"' + "$a" + '"'
#no native functions to extract a gzipped file
E:\temp\7za.exe x $b -oE:\temp -y

<#
###
Parse and grab the extracted results for the splunk field you need
Typically you only want the first value as our splunk alerts are
based on per host alert. This needs to change if you set an alert
that is a different field or is expected to have different host
results
#>
$hostRaw = Import-Csv .\results.csv | Select -ExpandProperty "host" -First 1
$hostName = $hostRaw.toString()

#Runs the command remotely as a job in background results returned to local host
#The only way to see if a command was ran is to look at the event logs on remote host
Invoke-Command -ComputerName $hostName -ThrottleLimit 15 -AsJob -ScriptBlock `
    {
        echo y | chkdsk /v /r /f
    }
#Clean up temp file so other scripts don't clobber it    
Remove-Item "E:\temp\results.csv"