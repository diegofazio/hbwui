/*
**  basic.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
*/

/*
 From a harbour program, it opens a new window showing some url
 Syntax: hbWUI_Init( cUrl, cTitle, nWidth, nHeight, lFullscreen, lResizable, lMaximized, lDebug )
*/

FUNCTION Main()

   hbWUI_Init( "https://www.hbtron.com", "hbWUI Basic Sample", 800, 600 )

RETURN NIL
