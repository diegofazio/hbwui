# hbwui WebView2/Cocoa/GTK Harbour Web UI

    hbwui_Init( cUrl, cTitle, nWidth, nHeight, lFullscreen, lResizable, lMaximized, lDebug )

### Harbour <-> Javascript

From Javascript:
    windows.external.invoke( cStr )
Get it from Harbour
    ack functhe hbwui_Callback( cStr ) and return 
    
## Windows 

ake sure you have the new Microsoft Edge (Chromium) installed.

## Linux

webview depends on `gtk+-3.0` and `webkit2gtk-4.0`:

```sh
sudo apt-get install libgtk-3-dev libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-dev
```

## MacOS

webview depends on the Cocoa and Webkit frameworks.