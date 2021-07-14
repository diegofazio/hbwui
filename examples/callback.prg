/*
**  callback.prg -- hbwui WebView2/Cocoa/GTK Harbour Web UI
**
** Developed by Diego Fazio(2021)
*/

FUNCTION Main()

   cHtml := 'data:text/html,'
   cHtml += '<!DOCTYPE html>'
   cHtml += '<html lang="en">'
   cHtml += '<head>'
   cHtml += '<meta charset="utf-8">'
   cHtml += '<meta http-equiv="X-UA-Compatible" content="IE=edge">'
   cHtml += '</head>'
   cHtml += '<body>'
   cHtml += '<div id="app"><h1>Hello HBWUI!!!</h1></div>'
   cHtml += '<div><button id="btn1" onclick="callback1()">Run Task1</button></div>'
   cHtml += '<div><button id="btn2" onclick="callback2()">Run Task2</button></div>'
   cHtml += '<script type="text/javascript">'
   cHtml += 'function callback1() {' + hb_eol()
   cHtml += 'window.external.invoke(JSON.stringify({ task: "task1", data: "datafromtask1" }))' + hb_eol()
   cHtml += '};' + hb_eol()
   cHtml += 'function callback2() {' + hb_eol()
   cHtml += 'window.external.invoke(JSON.stringify({ task: "task2", data: "datafromtask2" }))' + hb_eol()
   cHtml += '};' + hb_eol()
   cHtml += '</script>' + hb_eol()
   cHtml += '</body>'
   cHtml += '</html>'

   hbwui_Init( cHtml, "HBWUI Callback Sample", 1024, 768 )

RETURN

FUNCTION hbwui_Callback( cStr )

   local hStr := { => }, task := '', cRet 
   hb_jsonDecode( cStr, @hStr )
	switch hStr['task']
   case 'task1'
      cRet := 'You run task 1, data value: ' + hStr['data']
      exit
   case 'task2'         
      cRet := 'You run task 2, data value: ' + hStr['data']
      exit         
   end
 
RETURN "alert('" + cRet + "')"  //this is javascript code
