@echo off
setlocal
REM
REM  Copyright (C) 2016 CA. All rights reserved.
REM
set COPYCMD=/Y
C:
CD "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\."

if EXIST "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat" call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat"
set iefbind=
set PATH=;%PATH%
set btx=NMAKE.EXE
set btx=%btx%, CL.EXE, LINK.EXE
if exist CASCADE.DLL copy CASCADE.DLL CASCADE.BAK > NUL
if exist CASCADE.DLL del CASCADE.DLL > NUL
if exist CASCADE.DLL del CASCADE.BAK > NUL
if exist CASCADE.DLL goto IN_TEST
if not exist CASCADE.DLL if exist CASCADE.BAK ren CASCADE.BAK CASCADE.DLL
echo Initial search for build executables
set bt0error=
echo   %btx%
echo.
for %%n in (%btx%) do call "C:\Program Files (x86)\CA\Gen86Free\gen\bt0.bat" %%n
if "%bt0error%" == "Error" goto Failed
echo.
echo ==================RI Module Script Environment======================
echo Operating System: WINDOWS
echo Database Manager: "ODBC"
echo Environment:      WINDOWS
echo Language:         C
echo Codepage:
echo ==============================SUMMARY===============================
echo Summary of Load Module Script Results for Load Module CASCADE:
echo ==============================LEGEND================================
echo Legend: ... precedes information about an operation to be performed.
echo         --- precedes results from an operation
echo         *** precedes error info from an operation which just failed.
echo         (Symbols preceding info are indented to convey step levels.)
echo.
echo ==============================DETAILS===============================
echo Details of CASCADE Load Module Script Results:
nmake %iefmake% -f "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.MAK"
if NOT errorlevel 1 goto OK
if NOT exist "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT" goto FAILED
CALL "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
DEL "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT" > NUL
:FAILED
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE IEFSIGNAL:FAIL
echo.
if NOT "%IEFITER1%" == "" echo %IEFITER1%
if NOT "%IEFITER2%" == "" echo %IEFITER2%
echo *** Build process for RI module CASCADE Failed.  Review Results. ***
goto EXIT
:OK
if exist "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT" del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT" > NUL
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE IEFSIGNAL:OK
echo.
echo Build for RI module CASCADE complete.
goto EXIT
:IN_TEST
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE IEFSIGNAL:IN_TEST
echo.
echo *** RI Module CASCADE is currently being accessed. ***
echo *** Build for RI Module CASCADE Stopped. ***
echo *** Please exit all tests and Rebuild. ***
:EXIT
echo Important!  Review above for any errors.
endlocal
