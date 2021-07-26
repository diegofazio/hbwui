# hbwui WebView2/Cocoa/GTK Harbour Web UI
#
# Multiplatform Harbour GUI programs made in html/ccs and just a bit of js
#

    hbwui_Init( cUrl, cTitle, nWidth, nHeight, lFullscreen, lResizable, lMaximized, lDebug )

### Harbour <-> Javascript( See example callback.prg )

From Javascript:

    windows.external.invoke( cStr )

Get it from Harbour

    function hbwui_Callback( cStr )
    
        hbwui_RunJs( 'alert( 'Hello from harbour' )  

    return nil  
    
## Windows( 1 or 2 ) 

1) Make sure you have the LAST Microsoft Edge (Chromium beta, dev, or canary) installed.
2) Get the runtime directly(https://developer.microsoft.com/en-us/microsoft-edge/webview2/#download-section). Any of them.

## Linux

Webview depends on `gtk+-3.0` and `webkit2gtk-4.0`:

```sh
sudo apt-get install libgtk-3-dev libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-dev
```

## MacOS

Webview depends on the Cocoa and Webkit frameworks.

# http://www.hbtron.com
<img src="http://www.hbtron.com/hwtools512.png" width="250" title="hw_tools">
