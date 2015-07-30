REM 20150716 dc Wrapper script for Powershell launching and pass Variables
@echo on
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy unrestricted -NoProfile -File "E:\Program Files\Splunk\bin\scripts\remoteChkdsk.ps1" "%SPLUNK_ARG_0%" "%SPLUNK_ARG_1%" "%SPLUNK_ARG_2%" "%SPLUNK_ARG_3%" "%SPLUNK_ARG_4%" "%SPLUNK_ARG_5%" "%SPLUNK_ARG_6%" "%SPLUNK_ARG_7%" "%SPLUNK_ARG_8%"