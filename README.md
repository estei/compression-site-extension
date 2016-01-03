# Compression Site Extension

A site extension for Azure Web Apps that allows you to configure [http compression](https://www.iis.net/configreference/system.webserver/httpcompression) settings via AppSettings.

Works by changing the ApplicationHost.config file for the website.

**NOTE: HERE BE DRAGONS!**

This extension can cause quite a bit of trouble if you configure it wrong, so please read this carefully before installing.

There is no validation of the settings post install, so if you were to for instance remove one of the AppSetting values you could end up with a broken site or SCM site.

## Installation

Before you install you need to create three AppSettings in your site.

### XDT_COMPRESSION_EXT_FREQUENT_HIT_THRESHOLD

Sets the `frequentHitThreshold` attribute on the [system.webServer/serverRuntime](https://www.iis.net/configreference/system.webserver/serverruntime) element.

How many times should a static file be downloaded before it is compressed.

Value should be an integer between 1 and 2147483647

### XDT_COMPRESSION_EXT_STATIC_LEVEL

Sets the `staticCompressionLevel` attribute on the [system.webServer/httpCompression/scheme](https://www.iis.net/configreference/system.webserver/httpcompression/scheme) element.

How much should it compress static files.

Value should be an integer between 0 and 10.

### XDT_COMPRESSION_EXT_DYNAMIC_LEVEL

Sets the `dynamicCompressionLevel` attribute on the [system.webServer/httpCompression/scheme](https://www.iis.net/configreference/system.webserver/httpcompression/scheme) element.

How much should it compress dynamic files.

Value should be an integer between 0 and 10.