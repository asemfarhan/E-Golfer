@echo off
setlocal
REM
REM  Copyright (C) 2016 CA. All rights reserved.
REM
set COPYCMD=/Y
C:
CD "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\java\."
echo.
echo =====================RI Script Environment=================
echo Operating System: JVM
echo Database Manager: "JDBC"
echo Environment:      EJB
echo Language:         java
echo Codepage:
echo ISOEncoding:      UTF-8
echo.
echo ==============================SUMMARY===============================
echo Summary of RI Script Results for RI CASCADE:
echo ==============================LEGEND================================
echo Legend: ... precedes information about an operation to be performed.
echo         --- precedes results from an operation which just completed.
echo         *** precedes error info from an operation which just failed.
echo         (Symbols preceding info are indented to convey step levels.)
echo.
echo ==============================DETAILS===============================
echo Details of CASCADE RI Script Results:
set CLASSPATH=C:\Program Files (x86)\CA\Gen86Free\gen\bt\bt.jar;C:\Program Files (x86)\Java\jdk1.7.0_40\lib\tools.jar;%CLASSPATH%
@echo CLASSPATH=%CLASSPATH%
"C:\Program Files (x86)\Java\jdk1.7.0_40\bin\java.exe" -Xmx256m org.apache.tools.ant.Main -buildfile "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\java\CASCADE.XML"
if not errorlevel 1 goto OK
:FAILED
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE IEFSIGNAL:FAIL
echo.
if NOT "%IEFITER1%" == "" echo %iefiter1%
if NOT "%IEFITER2%" == "" echo %iefiter2%
echo *** Build for RI CASCADE Failed. ***
goto EXIT
:OK
"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE IEFSIGNAL:OK
echo Build for RI CASCADE Completed.
goto EXIT
:EXIT
echo Important!  Review above for any errors.
endlocal
