setlocal

set TMPFILE=%1.__tmp__
set MARKDOWNCMD=C:\markdown_preview\win\markdown.exe
set ROOT=C:\markdown_preview

type %1 %ROOT%\file_empty_line > %TMPFILE%

%MARKDOWNCMD% "%TMPFILE%" > "%ROOT%\tmp\__tmp__.md.html" 
type "%ROOT%\tpl\header.tpl.html" "%ROOT%\tmp\__tmp__.md.html" "%ROOT%\tpl\footer.tpl.html" > "%ROOT%\tmp\preview.html" 
rem must no double-quotes
start %ROOT%\tmp\preview.html

del %TMPFILE%
endlocal
