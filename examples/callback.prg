/*
**  callback.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**  Run harbour tunnel function with callback value from js 
**  Developed by Diego Fazio(2021)
*/

#xcommand TEXT <into:TO,INTO> <v> => #pragma __cstream|<v>:=%s

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
            <div id="app"><h1>HBWUI Callback Sample!!!</h1></div>
            <label for="text">Type javascript code ex: new Date().toUTCString()</label><br>
            <input type="text" size="100" id="text"/>
            <div><button id="btn1" onclick="callback();">Run Task1</button></div>
         </body>
      </html>
   ENDTEXT
   
   hbwui_SetTitle( 'HBWUI Callback Sample' )
   hbwui_tunnel( "callback", "{|| callback()}" )
   
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

function callback()

   local cInputValue := hbWUI_GetElementById( 'text', 'value' )
   hbWUI_RunJS( cInputValue, @save())
   
return 

//---------------------------------------------------------------------------

function save( cjsOut ) // cjsOut get return value from js execution code

   hbWUI_RunJS( "alert('",cjsOut,"');" )

return
