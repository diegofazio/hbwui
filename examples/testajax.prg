/*
**  testajax.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
**  Simple ajax emulation, with returning data directly from harbour
**  Developed by Diego Fazio(2021)
*/
REQUEST DBFCDX
FUNCTION Main()

   // Window tittle
   hbWUI_SetTitle( 'hbWUI Test Ajax Emulation' )

   hbWUI_tunnel( "fillSelect", "{|| fillSelect()}" )
   hbWUI_tunnel( "getData", "{|cInput| getData(cInput)}" )   

   // Could it be created ?
   IF ( hbWUI_Create() == -1  )
      RETURN
   ENDIF
   
   // Window size
   hbWUI_SetSize( 1024, 768 )
   
   // Load external url
   hbWUI_Navigate( "file:///"+ hb_DirBase() + "/testajax.html" )
   hbWUI_SetDebug( .T. )          

   // wait till WUI closes
   while ( hbWUI_Run() == 0 )
      
   enddo

RETURN
 
// When page is loaded, calls this function to fill select options
function fillSelect()
   
   LOCAL aRows := {}
   
   dbUseArea( .F., "DBFCDX", './data/test.dbf',, .T. )
   dbSetOrder(1)
   
   cAlias := Alias()
   
   WHILE ( (cAlias)->( !Eof() ) )

      cOpt := AllTrim((cAlias)->last) + ", " + AllTrim((cAlias)->first)
      hbWUI_RunJs( "document.getElementById('select1').add( new Option('",cOpt,"','",cOpt,"') )" )
//    Other way .....cOpt have to be public variable, not local 
//    hbWUI_RunJs( "document.getElementById('select1').add( new Option('{{cOpt)}}','{{cOpt}}') )" )
      
      (cAlias)->( DbSkip() )

   END

   hbWUI_RunJs( "$('.selectpicker').selectpicker('refresh');")
   (cAlias)->( dbCloseArea() )

return 

// When user type on input element, calls this function to get data and return it
function getData( cInput )

      LOCAL cHtml := "", cAlias
      
      if Empty(cInput) 
         return ""
      endif

      dbUseArea( .F., "DBFCDX", './data/test.dbf',, .T. )
      dbSetOrder(1)
      
      cAlias := Alias()
      (cAlias)->( OrdSetFocus( 'FIRST' ) )
      (cAlias)->( DbSeek( cInput, .T. ) )

      WHILE (cAlias)->first = cInput .and. (cAlias)->( !Eof() )         
         cHtml += AllTrim((cAlias)->first) + ", " + AllTrim((cAlias)->last) + "<br>"
         (cAlias)->( DbSkip() )         
      END

      if Empty( cHtml )
         cHtml := "<p>No data found</p>"
      end

      (cAlias)->( dbCloseArea() )
      
return cHtml
