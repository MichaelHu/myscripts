setlocal

set ORGIMG=..\product\img
set ORGMANIFEST=..\product\manifest
set ORGUIIMG=..\common\ui\GMU-ui\image
set ORGVSUIIMG=..\common\ui\VS-ui\image

set DSTROOT=..\release
set DSTJS=..\release\js
set DSTCSS=..\release\css
set DSTIMG=..\release\img
set DSTMANIFEST=..\release\manifest
set DSTUIIMG=..\release\img\ui

set build_type=""
if "%~1" == "debug" (
    set build_type="debug"    
)

mkdir %DSTJS%
mkdir %DSTCSS%
mkdir %DSTMANIFEST%
call:build ..\product\index.html %DSTROOT%\index.html html !build_type!
call:build common.js.build %DSTJS%\common.js js !build_type!
call:build iphone.js.build %DSTJS%\iphone.js js !build_type!
call:build iphone.css.build %DSTCSS%\iphone.css css !build_type!

call:build %ORGMANIFEST%\cache.manifest %DSTMANIFEST%\cache.manifest.tmp manifest !build_type!

rem manifest's built time
for /f %%i in ('date /t') do set BUILD_TIME=%%i
for /f %%i in ('time /t') do set BUILD_TIME=%BUILD_TIME% %%i
echo # build_time: %BUILD_TIME% > tmp_build_time
type %DSTMANIFEST%\cache.manifest.tmp tmp_build_time > %DSTMANIFEST%\cache.manifest
del %DSTMANIFEST%\cache.manifest.tmp
del tmp_build_time

xcopy /E /Y %ORGIMG% %DSTIMG% 
call:copy_with_svn_clear %ORGUIIMG%\toolbar %DSTUIIMG%\toolbar
call:copy_with_svn_clear %ORGUIIMG%\vstoolbar %DSTUIIMG%\vstoolbar
call:copy_with_svn_clear %ORGUIIMG%\quickdelete %DSTUIIMG%\quickdelete
call:copy_with_svn_clear %ORGUIIMG%\suggestion %DSTUIIMG%\suggestion
call:copy_with_svn_clear %ORGVSUIIMG%\productlist %DSTUIIMG%\productlist
call:copy_with_svn_clear %ORGVSUIIMG%\pageloading %DSTUIIMG%\pageloading
goto :eof

rem call:build build_file output_file file_type build_type
:build
    call wpp --use-config-file=build%4.conf %1 > %2.tmp
    if "%~4" == "debug" (
        move %2.tmp %2
    ) else (
        set compressable=false
        if "%3" == "js" set compressable=true
        if "%3" == "css" set compressable=true
        if "!compressable!" == "true" (
            java -jar yuicompressor-2.4.7.jar --type %3 --charset utf-8 %2.tmp > %2
            del %2.tmp
        ) else (
            move %2.tmp %2
        )
    )
goto :eof

:copy_with_svn_clear
    mkdir "%2"
    xcopy /E /Y "%1" "%2"
goto :eof


endlocal
