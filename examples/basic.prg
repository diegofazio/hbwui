/*
**  basic.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
*/

/*
 From a harbour program, it opens a new window showing some url
 Syntax: hbwui_Init( cUrl, cTitle, nWidth, nHeight, lFullscreen, lResizable, lMaximized, lDebug )
*/

FUNCTION Main()

   hbwui_Init( "https://www.hbtron.com", "HBWUI Basic Sample", 800, 600 )

RETURN NIL
