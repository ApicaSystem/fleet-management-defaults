@ECHO OFF

if not exist "C:\apica\" mkdir C:\apica

if not exist "C:\apica\otelcol" mkdir C:\apica\otelcol

powershell.exe -Command "Invoke-WebRequest -OutFile C:\apica\otelcol\otelcol-contrib_0.116.1_windows_amd64.tar.gz https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.116.1/otelcol-contrib_0.116.1_windows_amd64.tar.gz"

timeout /nobreak /t 1

checkmd5.exe --hash="2435b1df5be2c828367ac5c03a8c0e16a170dc4b2041165a02f46f3a9bc387102bfb19ad0504dcbedebea4fd84c6d019d11fb92901357d62b8d59b6b1e235af3" --file="C:\apica\otelcol\otelcol-contrib_0.116.1_windows_amd64.tar.gz" && (
    cd C:\apica\otelcol

    tar -xzvf otelcol-contrib_0.116.1_windows_amd64.tar.gz

    exit /b 0
)

echo "Downloaded package files do not match checksum"

exit /b 1
