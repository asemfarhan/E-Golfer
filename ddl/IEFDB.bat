@echo off
setlocal
REM
REM  Copyright (C) 2016 CA. All rights reserved.
REM
set COPYCMD=/Y
C:
CD "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\ddl\."
set PATH=C:\Program Files (x86)\CA\Gen86Free\gen\.\;%PATH%
set btx=TIS95DDL.EXE
echo Initial search for build executables
set bt0error=
echo %btx%
echo.
for %%n in (%btx%) do call "C:\Program Files (x86)\CA\Gen86Free\gen\bt0.bat" %%n
if "%bt0error%" == "Error" goto Failed
echo.
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" IEFDB "Database maintenance started"
echo.
echo Database maintenance started
   set IEFSERVER=MANSOUR\IEFDB
   set IEFUSER=admin
   set IEFPSWD=123
    "C:\Program Files (x86)\CA\Gen86Free\gen\.\TIS95DDL.EXE" "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\ddl\IEFDB.ins" %IEFSERVER% %IEFUSER% %IEFPSWD%
if errorlevel 1 goto FAILED
if errorlevel 0 goto OK
goto FAILED
:FAILED
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" IEFDB IEFSIGNAL:FAIL
echo.
if NOT "%IEFITER1%" == "" echo %IEFITER1%
if NOT "%IEFITER2%" == "" echo %IEFITER2%
echo IEFDB Error: Database Install Failed
echo.
goto EXIT
:OK
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" IEFDB IEFSIGNAL:OK
echo.
echo IEFDB Database Installed Successfully.
echo.
:EXIT
endlocal
