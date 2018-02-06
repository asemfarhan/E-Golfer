@echo off
setlocal
REM
REM  Copyright (C) 2016 CA. All rights reserved.
REM
set COPYCMD=/Y
C:
CD "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\ddl\."
set PATH=C:\Program Files (x86)\CA\Gen86Free\gen\.\;%PATH%
set btx=TIDB2DDL.EXE
echo Initial search for build executables
set bt0error=
echo %btx%
echo.
for %%n in (%btx%) do call "C:\Program Files (x86)\CA\Gen86Free\gen\bt0.bat" %%n
if "%bt0error%" == "Error" goto Failed
echo.
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" GOLFER1 "Database maintenance started"
echo.
echo Database maintenance started
   set IEFSERVER=DB2
   set IEFUSER=MANSOUR
   set IEFPSWD=123
    echo Copying Bind files to working directory.
    copy "C:\Program Files (x86)\CA\Gen86Free\gen\.\TIDB2DDL.BND" . > NUL
    echo.
    "C:\Program Files (x86)\CA\Gen86Free\gen\.\TIDB2DDL.EXE" "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\ddl\GOLFER1.ins" %IEFSERVER% %IEFUSER% %IEFPSWD%
if errorlevel 1 goto FAILED
if errorlevel 0 goto OK
goto FAILED
:FAILED
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" GOLFER1 IEFSIGNAL:FAIL
echo.
if NOT "%IEFITER1%" == "" echo %IEFITER1%
if NOT "%IEFITER2%" == "" echo %IEFITER2%
echo GOLFER1 Error: Database Install Failed
echo.
goto EXIT
:OK
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" GOLFER1 IEFSIGNAL:OK
echo.
echo GOLFER1 Database Installed Successfully.
echo.
:EXIT
endlocal
