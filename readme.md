# hbwui WebView2/Cocoa/GTK Harbour Web UI
#
# Multiplatform Harbour GUI programs made in html/ccs and just a bit of js
#

### Simple Webview initialization( examples/basic.prg )

    hbwui_Init( cUrl, cTitle, nWidth, nHeight, lFullscreen, lResizable, lMaximized, lDebug )

### Advanced Webview initialization( examples/advanced.prg )

    hbwui_SetTitle( cTitle )           // Set Webview windows title - Must be defined before hbwui_create().
    hbwui_Create()                     // Create Webview.
    hbwui_SetSize( nWidth, nHeight )   // Set Webview windows size.
    hbwui_SetFullscreen( lFullscreen ) // Start Webview in fullscreen mode(F12).
    hbwui_SetResizable( lResizable )   // Enable resize Webview windows.
    hbwui_SetDebug( lDebug )           // Enable context menu.
    hbwui_SetMaximized( lMaximized )   // Start Webview maximized.
    hbwui_Navigate( cHtml )            // Inyect html or define an Url for the Webview.
    hbwui_RunJs( cJscode )             // Run js code
    hbwui_Run()                        // Start Webview.
    hbwui_Exit()                       // Stop Webview execution.

### Harbour <-> Javascript( See example tunnel.prg )

Call from Javascript:

    add( 1,2 ); 

Run it from Harbour

    hbwui_tunnel( "add", "{| a,b | add( a, b )}" )  //define tunnel before hbwui_create()

    function add( a, b )    // define function in your project

        hbwui_RunJs( 'alert("The result is: ' + str( a + b ) + '")' )

    return     
    
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
