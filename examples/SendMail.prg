/*
**  upload.prg -- hbWUI WebView2/Cocoa/GTK Harbour Web UI
**  Compile with hbwin.hbc and set mail server parameters -> SendMail.json
** Developed by Diego Fazio(2022)
*/

FUNCTION Main()

   // Window tittle
   hbWUI_SetTitle( 'hbWUI simple Email sender App' )

   hbWUI_tunnel( "submit", "{| a | submit( a )}" )

   // Window size
   hbWUI_SetSize( 700, 650 )

   // Could it be created ?
   IF ( hbWUI_Create() == -1  )
      RETURN
   ENDIF


   // Load local file
   hbWUI_Navigate( "file:///" + hb_DirBase() + "/SendMail.html" )
   hbWUI_SetDebug( .T. )

   // wait till WUI closes
   WHILE ( hbWUI_Run() == 0 )
   ENDDO

RETURN

FUNCTION submit( cParam )

   LOCAL hParams := hb_jsonDecode( cParam ), hParam
   LOCAL cSubject, cBody, cTo, aFiles := {}

   LOCAL hMailCfg := hb_jsonDecode( hb_MemoRead( "SendMail.json" ) )

   if !hb_DirExists( "./Files")
      hb_DirCreate( "./Files" )
   end
   
   FOR EACH hParam in hParams
      
      hb_MemoWrit( "./files/" + hParam[ 'name' ], ;
         hb_base64Decode( SubStr( hParam[ 'data' ], nStart := At( "base64,", hParam[ 'data' ] ) + 7 ) ) )
      
      AAdd( aFiles, hb_DirBase() + "\files\" + hParam[ 'name' ] )
      
   NEXT

   cSubject := hbWUI_GetElementById( 'inputSubject', 'value' )
   cBody    := hbWUI_GetElementById( 'inputBody', 'value' )
   cTo      := hbWUI_GetElementById( 'inputTo', 'value' )
   
   SendMail( cSubject, cTo, cBody, aFiles, hMailCfg )

RETURN

FUNCTION SendMail( ASUNTO, DESTINO, MSG, ADJUNTO, MAILCFG )
   
   local cFile
   
   IF ( oCDOMsg := win_oleCreateObject( "CDO.Message" ) ) != NIL
      oCDOConf := win_oleCreateObject( "CDO.Configuration" )
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/sendusing" ):Value := 2 // ; cdoSendUsingPort
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/smtpserver" ):Value := MAILCFG['MAIL_SMTP']
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/smtpserverport" ):Value := MAILCFG['MAIL_PUERTO']
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout" ):Value := 30
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/sendusername" ):Value := MAILCFG['MAIL_USUARIO']
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/sendpassword" ):Value := MAILCFG['MAIL_CLAVE']
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/smtpusessl" ):Value := .F.
      oCDOConf:Fields( "http://schemas.microsoft.com/cdo/configuration/smtpauthenticate" ):Value := 1
      oCDOConf:Fields:Update()
      oCDOMsg:Configuration := oCDOConf
      oCDOMsg:BodyPart:Charset := "iso-8859-2" // "iso-8859-1" "utf-8"
      oCDOMsg:TO := DESTINO
      oCDOMsg:FROM := MAILCFG['MAIL_USUARIO']
      oCDOMsg:Subject := ASUNTO
      oCDOMsg:TextBody := MSG
      IF len( ADJUNTO ) > 0
         for each cFile in ADJUNTO
            oCDOMsg:AddAttachment( cFile )
         next
      ENDIF
      BEGIN SEQUENCE WITH {| oErr | Break( oErr ) }
         oCDOMsg:Send()
         hbWUI_RunJs( 'alert( "Mail enviado con exito" );' )
      RECOVER
         hbWUI_RunJs( 'alert( "' + AllTrim( win_oleErrorText() ) + '" );' )
      END SEQUENCE
   ELSE
      hbWUI_RunJs( 'alert( "No existe Objeto CDO.Message" );' )
   ENDIF

RETURN
