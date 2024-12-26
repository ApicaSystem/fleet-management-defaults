@ECHO OFF

if not exist "C:\apica\" mkdir C:\apica

if not exist "C:\apica\prometheus" mkdir C:\apica\prometheus

powershell.exe -Command "Invoke-WebRequest -OutFile C:\apica\prometheus\prometheus.tar.gz https://github.com/prometheus/prometheus/releases/download/v3.0.1/prometheus-3.0.1.windows-amd64.tar.gz"

timeout /nobreak /t 1

checkmd5.exe --hash="23efaf9480b6026bafb6cd8ef67a25673fb88d641e94ebf9459855675ab63fad9742e9e7eb99f9e9ae3dfe09df8521d65efd181c7fffd11cc9e7a8d25465946d" --file="C:\apica\prometheus\prometheus.tar.gz" && (
    cd C:\apica\prometheus

    tar -xzvf prometheus.tar.gz

    cd prometheus-3.0.1.windows-amd64

    move * ..
    
    cd ..
    
    rmdir /S /Q prometheus-3.0.1.windows-amd64

    exit /b 0
)

echo "Downloaded package files do not match checksum"

exit /b 1
