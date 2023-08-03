/*
**  scraping.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
**  Load an url and scrape content 
**  
**  Developed by Diego Fazio(2023)
*/

#xcommand TEXT <into:TO,INTO> <v> => #pragma __cstream|<v>:=%s

FUNCTION Main()

   local cHtml := ''
// Js code to create button when web is loaded.
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

       // Establecer atributos y contenido del botón
       button.innerHTML = "Write text in google input and Click";
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
         const textareas = document.getElementsByTagName("textarea");
         getScrape(textareas[0].value);
       });
     });
   ENDTEXT

   hbwui_SetTitle( 'Scraping Sample' )
   hbWUI_tunnel( "getScrape", "{| cInput | getScrape( cInput )}" )
   
   IF ( hbwui_Create() == -1  )
      RETURN
   ENDIF

   hbwui_SetSize( 1024, 768 )
   hbwui_SetDebug( .T. )          
   hbWUI_preEval(cHtml)
   hbwui_Navigate( "https://www.google.com" )
   while ( hbwui_Run() == 0 )
   enddo

RETURN
//---------------------------------------------------------------------------

function getScrape( cInput )

   hbWUI_RunJS( "alert('" + cInput + "')" )   
   
return 
