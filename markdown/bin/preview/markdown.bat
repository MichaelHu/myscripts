setlocal

set FILENAME=%1
set MARKDOWNCMD=C:\markdown\markdown.exe
set ROOT=C:\markdown

%MARKDOWNCMD% "%FILENAME%" > %ROOT%\tmp\__tmp__.md.html 
type "%ROOT%\tpl\header.tpl.html" "%ROOT%\tmp\__tmp__.md.html" "%ROOT%\tpl\footer.tpl.html" > "%ROOT%\tmp\preview.html" 
start "%ROOT%\tmp\preview.html"

endlocal
