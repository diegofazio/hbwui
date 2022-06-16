/*
**  changeclass.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
** From a harbour program, change DOM element class
** Developed by Diego Fazio(2021)
*/

FUNCTION Main()

   // Window tittle
   hbWUI_SetTitle( 'hbWUI callback' )

   hbWUI_tunnel( "changeclass", "{|| changeclass()}" )  // define the tunnel

   // Could it be created ?
   IF ( hbWUI_Create() == -1  )
      RETURN
   ENDIF
   
   // Window size
   hbWUI_SetSize( 1024, 768 )
   
   // Load external url
   hbWUI_Navigate( "file:///"+ hb_DirBase() + "/changeclass.html" )
   hbWUI_SetDebug( .T. )          

   // wait till WUI closes
   while ( hbWUI_Run() == 0 )
   enddo

RETURN
 
function changeclass()

   // WARNING: despite in html the property is called "class" internally the DOM has it as "classname"
   cClass := hbWUI_GetElementById('title','class') // Read class property of the title element 
   hbWUI_SetElementById( 'title', 'className', hb_StrReplace(cClass, "background", "" ) ) // Change it
   // It takes inmediate effect on the page
   
return



