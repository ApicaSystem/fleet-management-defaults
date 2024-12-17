@ECHO OFF

if not exist "C:\apica\" mkdir C:\apica

if not exist "C:\apica\otelcol" mkdir C:\apica\otelcol

powershell.exe -Command "Invoke-WebRequest -OutFile C:\apica\otelcol\otelcol-contrib_0.112.0_windows_amd64.tar.gz https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.112.0/otelcol-contrib_0.112.0_windows_amd64.tar.gz"

timeout /nobreak /t 1

checkmd5.exe --hash="ce0c74df7fc04dbd3f82ec378f4566e48a516e721cb5f8ebc236a625c5ac83109810d45737e5608daa84703bb94eb3a1b3294d53e9cbc13913e75e7fb2a095c5" --file="C:\apica\otelcol\otelcol-contrib_0.112.0_windows_amd64.tar.gz" && (
    cd C:\apica\otelcol

    tar -xzvf otelcol-contrib_0.112.0_windows_amd64.tar.gz

    exit /b 0
)

echo "Downloaded package files do not match checksum"

exit /b 1
