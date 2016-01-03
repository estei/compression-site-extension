SET extensionPath="%HOME%\SiteExtensions\CompressionSettings"
SET success=true

IF NOT DEFINED XDT_COMPRESSION_EXT_STATIC_LEVEL (
    ECHO XDT_COMPRESSION_EXT_STATIC_LEVEL Appsetting NOT FOUND
    SET success=false
)
IF NOT DEFINED XDT_COMPRESSION_EXT_DYNAMIC_LEVEL (
    ECHO XDT_COMPRESSION_EXT_DYNAMIC_LEVEL Appsetting NOT FOUND
    SET success=false
)
IF NOT DEFINED XDT_COMPRESSION_EXT_FREQUENT_HIT_THRESHOLD (
    ECHO XDT_COMPRESSION_EXT_FREQUENT_HIT_THRESHOLD Appsetting NOT FOUND
    SET success=false
)
IF "%success%"=="true" (
    ECHO Install was a success    
    copy "%extensionPath%\applicationHost.base.xdt" "%extensionPath%\applicationHost.xdt"  
) ELSE (
    ECHO Install was unsuccessful
    SET ERRORLEVEL=404    
)