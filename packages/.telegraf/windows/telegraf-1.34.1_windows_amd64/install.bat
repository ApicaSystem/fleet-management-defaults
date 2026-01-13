@ECHO OFF

if not exist "C:\apica\" mkdir C:\apica

if not exist "C:\apica\telegraf" mkdir C:\apica\telegraf

powershell.exe -Command "Invoke-WebRequest -OutFile C:\apica\telegraf\telegraf-1.34.1_windows_amd64.zip https://dl.influxdata.com/telegraf/releases/telegraf-1.34.1_windows_amd64.zip"

timeout /nobreak /t 1

checkmd5.exe --hash="8fe70293868aaa1800e0e8104395882ed3e010082fddcbf8a271abb2202be6deffd8cf97e904c2ccebaa2bec09a1bfcb50007f9ba1b49d48ddd23bc9809a1b2a" --file="C:\apica\telegraf\telegraf-1.34.1_windows_amd64.zip" && (
    cd C:\apica\telegraf

    powershell.exe -Command "Expand-Archive C:\apica\telegraf\telegraf-1.34.1_windows_amd64.zip -DestinationPath C:\apica"

    cd C:\apica

    powershell.exe -Command "Remove-Item -Path C:\apica\telegraf -Force -Recurse"

    powershell.exe -Command "Rename-Item -Path C:\apica\telegraf-1.34.1\ -NewName telegraf"

    exit /b 0
)

echo "Downloaded package files do not match checksum"

exit /b 1
