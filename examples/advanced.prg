/*
**  advance.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
/*
 From a harbour program, it opens a new window showing some url
*/

FUNCTION Main()

   // Window tittle
   hbwui_SetTitle( 'hbWUI' )

   // Could it be created ?
   IF ( hbwui_Create() == -1  )
      RETURN
   ENDIF
   
   // Window size
   hbwui_SetSize( 1024, 768 )
   
   // Load external url
   hbwui_Navigate( "http://www.hbtron.com" )

   // wait till WUI closes
   while ( hbwui_Run() == 0 )
   enddo

RETURN
