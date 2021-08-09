/*
**  advance.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
/*
 From a harbour program, it opens a new window showing some url
*/

FUNCTION Main()

   // Window tittle
   hbWUI_SetTitle( 'hbWUI' )

   // Could it be created ?
   IF ( hbWUI_Create() == -1  )
      RETURN
   ENDIF
   
   // Window size
   hbWUI_SetSize( 1024, 768 )
   
   // Load external url
   hbWUI_Navigate( "http://www.hbtron.com" )

   // wait till WUI closes
   while ( hbWUI_Run() == 0 )
   enddo

RETURN
