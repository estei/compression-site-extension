# Compression Site Extension

A site extension for Azure Web Apps that allows you to configure [http compression](https://www.iis.net/configreference/system.webserver/httpcompression) settings via AppSettings.

Works by changing the ApplicationHost.config file for the website.

**NOTE: HERE BE DRAGONS!**

This extension can cause quite a bit of trouble if you configure it wrong, so please read this carefully before installing.

There is no validation of the settings post install, so if you were to for instance remove one of the AppSetting values you could end up with a broken site or SCM site.

## Build

Run the build.cmd not forgetting to add a version ex. `build.cmd 0.0.1` for instance.
This creates a nuget package in the artifacts folder, that you can add to your own nuget feed.
I have created a nuget feed (https://www.myget.org/F/compression-site-extension/api/v2) that you can use, but you should probably use your own.

## Installation

Installation is a bit manual since I do not want to put this in the gallery.
It uses some functionality I do not think was intended by the kudu guys and can as noted earlier cause quite a bit of havoc in your sites.

First you build the package like described in the [build](#build) section, and add the package to a nuget feed.

### AppSettings

Create the following AppSettings in your site.

#### SCM_SITEEXTENSIONS_FEED_URL

Value should be the url to your nuget feed.

Note:    
This will limit the number of extensions you see in the backend gallery.    
On for instance myget there are ways to add upstream feeds so that you can serve all the extensions through your own feed.

#### XDT_COMPRESSION_EXT_FREQUENT_HIT_THRESHOLD

Sets the `frequentHitThreshold` attribute on the [system.webServer/serverRuntime](https://www.iis.net/configreference/system.webserver/serverruntime) element.

How many times should a static file be downloaded before it is compressed.

Value should be an integer between 1 and 2147483647

#### XDT_COMPRESSION_EXT_STATIC_LEVEL

Sets the `staticCompressionLevel` attribute on the [system.webServer/httpCompression/scheme](https://www.iis.net/configreference/system.webserver/httpcompression/scheme) element.

How much should it compress static files.

Value should be an integer between 0 and 10.

#### XDT_COMPRESSION_EXT_DYNAMIC_LEVEL

Sets the `dynamicCompressionLevel` attribute on the [system.webServer/httpCompression/scheme](https://www.iis.net/configreference/system.webserver/httpcompression/scheme) element.

How much should it compress dynamic files.

Value should be an integer between 0 and 10.

### Gallery install

Go the kudu (SCM) site and go the `Site Extensions` section.    
Your gallery should now show the CompressionSettings extension.    
Click the install button, and if you have the above AppSettings you should be running with better compression.

## Alternative installation method (ARM)

It is possible to use Azure Resource Manager for installation, see [this blog post](http://www.wadewegner.com/2015/01/creating-a-go-site-extension-and-resource-template-for-azure/) to get an idea how.