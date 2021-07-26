/*
**  advance.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
/*
 From a harbour program, it opens a new window showing some url

 default values:
 ---------------
 hbwui_SetSize( 800, 600 )
 hbwui_SetFullscreen( .F. )
 hbwui_SetResizable( .T. )
 hbwui_SetDebug( .F. )
 hbwui_SetMaximized( .F. )

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
