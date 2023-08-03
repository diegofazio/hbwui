/*
**  scraping2.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
**  Load an url and scrape content 
**  
**  Developed by Diego Fazio(2023)
*/

#xcommand TEXT <into:TO,INTO> <v> => #pragma __cstream|<v>:=%s

FUNCTION Main()

   local cHtml := ''
   public nOrd := 1
   
   TEXT TO cHtml
     document.addEventListener("DOMContentLoaded", function() {
       var divContainer = document.createElement("div");
       divContainer.id = "button-container";

       divContainer.style.position = "fixed";
       divContainer.style.top = "50%";
       divContainer.style.left = "50%";
       divContainer.style.transform = "translate(-50%, -50%)";
       divContainer.style.zIndex = "9999";

       var button = document.createElement("button");

       button.innerHTML = "Click me to fill Form!!";
       button.id = "my-button";

       button.style.backgroundColor = "#ff4081"; 
       button.style.color = "#fff"; 
       button.style.padding = "15px 30px"; 
       button.style.border = "none"; 
       button.style.borderRadius = "10px"; 
       button.style.fontSize = "20px"; 
       button.style.fontWeight = "bold";
       button.style.cursor = "pointer"; 
    
       divContainer.appendChild(button);

       document.body.appendChild(divContainer);

       button.addEventListener("click", function() {
         fillForm();
       });
     });
  ENDTEXT

   hbwui_SetTitle( 'Scraping Sample2' )
   hbWUI_SetMaximized( .T. )
   hbWUI_tunnel( "fillForm", "{|| fillForm()}" )
   
   IF ( hbwui_Create() == -1  )
      RETURN
   ENDIF

   hbWUI_PreEval(cHtml)
   hbwui_Navigate( "https://www.w3schools.com/html/html_forms.asp" )
   while ( hbwui_Run() == 0 )

   enddo

RETURN

//---------------------------------------------------------------------------

function fillForm()

   hbWUI_SetElementById( 'fname', 'value', 'My name' + LTrim( Str( nOrd ) ) )
   hbWUI_SetElementById( 'lname', 'value', 'My lastname' + LTrim( Str( nOrd ) ) )
   nOrd ++
   
return 

