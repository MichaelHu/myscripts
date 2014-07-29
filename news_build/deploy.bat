@echo off
setlocal
set DST=..\..\..\news_android
set DST_STATIC=..\..\..\static\news\webapp_lite

echo "building..."
%comspec% /v:on /c "build.bat %1"

echo "releasing..."

mkdir %DST%
mkdir %DST_STATIC%\js
mkdir %DST_STATIC%\img
mkdir %DST_STATIC%\css
mkdir %DST_STATIC%\mock
mkdir %DST_STATIC%\manifest

copy ..\release\index.html %DST%
copy ..\product\mock\* %DST_STATIC%\mock
xcopy /e /y ..\release\img %DST_STATIC%\img
copy ..\release\js\*.js %DST_STATIC%\js
copy ..\release\css\*.css %DST_STATIC%\css
copy ..\release\manifest\*.manifest %DST_STATIC%\manifest
endlocal
