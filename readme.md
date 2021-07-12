# hbwui WebView2/Cocoa/GTK Harbour Web UI

    hbwui_Init( cUrl, cTitle, nWidth, nHeight, lFullscreen, lResizable, lMaximized, lDebug )

### Harbour <-> Javascript( See example callback.prg )

From Javascript:

    windows.external.invoke( cStr )

Get it from Harbour

    function hbwui_Callback( cStr )
    
    ....

    return "alert('hello from harbour')  //and return running Javascript code.
    
## Windows 

Make sure you have the new Microsoft Edge (Chromium) installed.

## Linux

Webview depends on `gtk+-3.0` and `webkit2gtk-4.0`:

```sh
sudo apt-get install libgtk-3-dev libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-dev
```

## MacOS

Webview depends on the Cocoa and Webkit frameworks.