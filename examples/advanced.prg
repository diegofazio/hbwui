/*
**  advance.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
/*
 From a harbour program, it opens a new window showing some url
*/

FUNCTION Main()

   hbwui_SetTitle( 'Amigo+' )

   IF ( hbwui_Create() == -1  )
      RETURN
   ENDIF

   hbwui_SetSize( 1280, 1024 )
   hbwui_Navigate( "http://localhost/amigo" )

   while ( hbwui_Run() == 0 )

   enddo

RETURN
