/*
**  callback.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
**  Calls a harbour function from html/js 
**  
**  Developed by Diego Fazio(2021)
*/
#xcommand TEXT <into:TO,INTO> <v> => #pragma __cstream|<v>:=%s

// Creates html window

FUNCTION Main()

   local cHtml := ''

   TEXT TO cHtml
      data:text/html,
      <!DOCTYPE html>
      <html lang="en">
         <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
         </head>
         <body>
            <div id="app"><h1>Hello HBWUI!!!</h1></div>
            <div><button id="btn1" onclick="add(5,2);">Run Task1</button></div>
         </body>
      </html>
   ENDTEXT
   
   hbwui_SetTitle( 'HBWUI Tunnel Sample' )
   hbwui_tunnel( "add", "{| a,b | add( a, b )}" )

   IF ( hbwui_Create() == -1  )
      RETURN
   ENDIF

   hbwui_SetSize( 1024, 768 )
   hbwui_SetDebug( .T. )          
   hbwui_Navigate( cHtml )
   
   while ( hbwui_Run() == 0 )

   enddo

RETURN

//---------------------------------------------------------------------------

function add( a, b )

   hbwui_RunJs( 'alert("The result is: ' + str( a + b ) + '")' )

return 

//---------------------------------------------------------------------------

