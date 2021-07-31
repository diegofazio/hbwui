/*
**  tunnel.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
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
            <div id="app"><h1>Hello hbWUI!!!</h1></div>
            <div>Name:<input type="text" maxlength="512" id="name" value="Text sample"/><button id="btn1" onclick="text(document.getElementById('name').value);">Send data to Harbour</button></div><br>
            <div><button id="btn2" onclick="add(5,2);">Run Task from Harbour</button></div><br>
            <div><button id="btn3" onclick="setStyle();">Set new style from Harbour</button></div>            
         </body>
      </html>
   ENDTEXT
   
   hbWUI_SetTitle( 'hbWUI Tunnel Sample' )
   hbWUI_tunnel( "add", "{| a,b | add( a, b )}" )
   hbWUI_tunnel( "text", "{|a| text(a)}" )   
   hbWUI_tunnel( "setStyle", "{|| setStyle()}" )      

   IF ( hbWUI_Create() == -1  )
      RETURN
   ENDIF

   hbWUI_SetSize( 1024, 768 )
   hbWUI_SetDebug( .T. )          
   hbWUI_Navigate( cHtml )
   
   while ( hbWUI_Run() == 0 )

   enddo

RETURN

//---------------------------------------------------------------------------

function add( a, b )

   hbWUI_RunJs( 'alert("The result is: ' + str( a + b ) + '")' )

return 

//---------------------------------------------------------------------------

function text( a )

   hbWUI_RunJs( 'alert(" Input text value: ' + a + '")' )
   
return

//---------------------------------------------------------------------------

function setStyle()

   local cCss := ''

   TEXT TO cCss
   body {
     color: red;
     background-color: #d8da3d }   
   ENDTEXT

   hbWUI_ApplyCss( cCss )

return 

//---------------------------------------------------------------------------