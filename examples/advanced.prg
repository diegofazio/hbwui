/*
**  advance.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
/*
 From a harbour program, it opens a new window showing some url
*/

FUNCTION Main()

   hbwui_SetTitle( 'HBWUI Advanced Sample' )

   IF ( hbwui_Create() == -1  )
      RETURN
   ENDIF

   hbwui_SetSize( 1024, 768 )
   hbwui_Navigate( "https://www.hbtron.com" )
   hbwui_Run()

RETURN
