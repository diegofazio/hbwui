/*
**  tunnel.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
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
      data:text/html,   // mandatory line for inline pages
      <!DOCTYPE html>
      <html lang="en">
         <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
         </head>
         <body>
            <div id="app"><h1>Hello HBWUI!!!</h1></div>
            <div>Name:<input type="text" maxlength="512" id="name" value="Text sample"/><button id="btn1" onclick="text(document.getElementById('name').value);">Send data to Harbour</button></div><br>
            <div><button id="btn2" onclick="add(5,2);">Run Task from Harbour</button></div>
         </body>
      </html>
   ENDTEXT
   
   // Main Window Title
   hbwui_SetTitle( 'HBWUI Tunnel Sample' )
   
   // Al tunnels MUST be declared BEFORE HTML rendering
   hbwui_tunnel( "add", "{| a,b | add( a, b )}" )
   hbwui_tunnel( "text", "{|a| text(a)}" )   

   // Could it be created ok ?
   IF ( hbwui_Create() == -1  )
      RETURN
   ENDIF

   // Change some Window properties
   hbwui_SetSize( 1024, 768 )
   hbwui_SetDebug( .T. )       // Enables the inspector
         
   // Launch and render HTML WUI    
   hbwui_Navigate( cHtml )
   
   // Main loop
   while ( hbwui_Run() == 0 )
   enddo

RETURN

//---------------------------------------------------------------------------

function add( a, b )

   // harbour does its thing and then optionally executes a JS script on the WUI
   hbwui_RunJs( 'alert("The result is: ' + str( a + b ) + '")' )

return 

//---------------------------------------------------------------------------

function text( a )

   // ditto
   hbwui_RunJs( 'alert(" Input text value: ' + a + '")' )
   
return

//---------------------------------------------------------------------------