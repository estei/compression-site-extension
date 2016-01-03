SET version=%1
set artifactsdir=artifacts
IF NOT EXIST "%artifactsDir%" (
    mkdir "%artifactsDir%"
)
nuget pack CompressionSettings.nuspec -Version %version% -OutputDirectory "%artifactsDir%"