/*
**  login.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
/*
 From a harbour program, change DOM element class
*/
#include "hbthread.ch"

FUNCTION Main()

   // Window tittle
   hbWUI_SetTitle( 'hbWUI callback' )

   hbWUI_tunnel( "changeclass", "{|| changeclass()}" )

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

   cClass := hbWUI_GetElementById('title','class')
   hbWUI_SetElementById( 'title', 'className', hb_StrReplace(cClass, "background", "" ) )

return



