/*
**  login.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
**  Developed by Diego Fazio(2021)
*/

FUNCTION Main()

   // Window tittle
   hbWUI_SetTitle( 'hbWUI basic login sample' )

   hbWUI_tunnel( "submit", "{| a | submit( a )}" )

   // Could it be created ?
   IF ( hbWUI_Create() == -1  )
      RETURN
   ENDIF
   
   // Window size
   hbWUI_SetSize( 1024, 768 )
   
   // Load local file
   hbWUI_Navigate( "file:///"+ hb_DirBase() + "/login.html" )
   hbWUI_SetDebug( .T. )          

   // wait till WUI closes
   while ( hbWUI_Run() == 0 )
   enddo

RETURN

function submit( a )

      local hParam := {=>}
      hb_jsonDecode( a, @hParam )

// Here you could validate the mail and password...
// with hParam['inputEmail'] and hParam['inputPassword']

      hbWUI_RunJs( 'alert( "Welcome :' + hParam['inputEmail'] +'" );' )

return
