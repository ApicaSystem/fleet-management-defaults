@ECHO OFF

if not exist "C:\apica\" mkdir C:\apica

if not exist "C:\apica\fluent-bit" mkdir C:\apica\fluent-bit

powershell.exe -Command "Invoke-WebRequest -OutFile C:\apica\fluent-bit\fluent-bit-3.2.3-win64.zip https://packages.fluentbit.io/windows/fluent-bit-3.2.3-win64.zip"

timeout /nobreak /t 1

checkmd5.exe --hash="2f27e213f0b03ea8c4ad83dd56d97f2591866ad053c249f13787b7667d79dde57ce8df4eeaba0b7b1d6d117efbc233c75ea4706da2042e3fe1172fc81a654b5f" --file="C:\apica\fluent-bit\fluent-bit-3.2.3-win64.zip" && (
    cd C:\apica\fluent-bit

    powershell.exe -Command "Expand-Archive C:\apica\fluent-bit\fluent-bit-3.2.3-win64.zip -DestinationPath C:\apica"

    cd C:\apica

    rmdir /S /Q fluent-bit

    rename fluent-bit-3.2.3-win64 fluent-bit

    exit /b 0
)

echo "Downloaded package files do not match checksum"

exit /b 1
