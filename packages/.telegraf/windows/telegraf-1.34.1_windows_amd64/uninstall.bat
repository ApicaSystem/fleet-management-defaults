@ECHO OFF

if exist "C:\apica\telegraf" powershell.exe -Command "Remove-Item -Path C:\apica\telegraf -Force -Recurse"
