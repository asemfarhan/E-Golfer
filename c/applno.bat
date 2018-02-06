@echo OFF
@echo APPLNO.BAT : CA Gen BUILDTIME and BUILDVER update file
REM
REM CA Gen
REM Copyright (C) 2016 CA. All rights reserved.
REM     
REM ##------------------------------------------------------------------
REM ##  Applno.bat will update the BUILDTIME macro to reflect the 
REM ##  current timestamp.  This BUILDTIME macro is compiled into the
REM ##  application's resource file, so that the properties windows of
REM ##  the EXE will reflect an accurate timestamp.
REM ## 
REM ##  Applno.bat will also increment BUILDVER and BUILDVER2 which
REM ##  will also be compiled into the application's resource file, so
REM ##  that the properties window of the EXE will reflect the number
REM ##  of builds that have taken place. The resultant file 
REM ##  ( <execunit>_buildver.h ) can be modified by the customer in
REM ##  order to manage the build version number.
REM ##
REM ##  For backward compatibility (GUI apps only - not needed if GUI
REM ##  apps are regenerated), if application.h is not included
REM ##  before generic.rc, a copy of generic.rc is copied into the 
REM ##  model directory, and the #include for both application.h
REM ##  and the newly generated {GUI-LM}_buildver.h are added to the
REM ##  top of the file to correctly increment the builds.
REM ##
REM ##  Parameter 1 is a flag to indicate whether to increment or not
REM ##              (YES or NO)
REM ##
REM ##  Parameter 2 is the fully qualified current working directory
REM ##
REM ##  Parameter 3 is the execunit MEMBER name
REM ##
REM ##  Parameter 4 is the current Gen directory, used to copy the
REM ##              generic.rc file used for backward compatibility
REM ##                             
REM ##  Parameter 5 is a flag to indicate what the type of appl the 
REM ##              RC file is targeted for ("GUI","BM",etc.).  This
REM ##              flag will be used for backward compatibility.
REM ##                             
REM ##  MODIFICATIONS: 
REM ##
REM ##  07/29/02 - RAL  - initial development
REM ##  08/28/02 - RAL  - Added support for ME/98
REM ##  02/21/03 - RAL  - Use Codepage 1252 for Time/Date
REM ##  04/28/04 - RAL  - Remove ME logic. Support long filenames.
REM ##  09/02/04 - RAL  - 13663843 Correct TIME/DATE extraction to better
REM ##                    support NLS.  Also remove codepage logic.
REM ##  09/06/05 - RAL  - 13609845 Remove incrementation of build version
REM ##                    number.  This is controlled by the customer.
REM ##  09/07/05 - RAL  - 13609845 Create new file appl_buildtime.h
REM ##                    to hold timestamp for application.  Old #define's
REM ##                    for BUILDVERS and BUILDVERS2 are appended to 
REM ##                    application.h if they are not yet there.
REM ##  06/24/10 - RAL  - 16546418 Revised to increment BUILDVERS:
REM ##                    1) Added 2nd parameter for EXECUNIT name
REM ##                    2) Create new {EXECUNIT}.rc containing #include
REM ##                       application.h, #include {EXECUNIT}_buildvers.h
REM ##                       and #include generic.rc NON-GUI builds
REM ##                    3) Extract, increments, and writes out BUILDVERS
REM ##                       from/to {EXECUNIT}_buildvers.h. If file does
REM ##                       not exist, it is created with BUILDVERS of 1
REM ##  07/15/10 - RAL  - 16546418 Handle GUI backward compatibility
REM ##  10/10/11 - RAL  - Correct incrementing of version_num 
REM ##  12/05/11 - RAL  - move goto when no versioning file exists
REM ##  08/22/13 - GBUR - Corrected find command parms
REM ##  11/04/13 - RAL/GBUR  - Now receiving new Param 1 to indicate whether or
REM ##                    not to increment version.
REM ##                    Using fully qualified version filename.
REM ##                    Also using fully qualified RC filename.
REM ##------------------------------------------------------------------
SETLOCAL

REM
REM  Define local variables
REM

set increment_flag=%1
set model_dir=%2
set execunit=%3
set gen_dir=%4
set rc_type=%5
set application_file=%model_dir:~0,-1%application.h"
set build_ver_file=%model_dir:~0,-1%%execunit%_buildver.h"
set rc_file=%model_dir:~0,-1%%execunit%.rc"
set generic_rc_file=%model_dir:~0,-1%generic.rc"
if not "%rc_type%Z"=="Z" set gen_generic_rc_file=%gen_dir:~0,-1%version\generic.rc"

REM
REM  Capture time to be added to BUILDTIME
REM

echo | time /t > time_temp.out
for /f "tokens=1 delims={" %%a in (time_temp.out) do set TEMP_TIME=%%a
del time_temp.out

REM
REM  Capture date to be added to BUILDTIME
REM

echo | date /t > date_temp.out
for /f "tokens=1 delims={" %%a in (date_temp.out) do set TEMP_DATE=%%a
del date_temp.out

REM
REM  If building a BM/Server load module or CBD/Cascade DLL for 
REM  the 1st time, no RC file exists.  Create one which will include
REM  the build version header being created along with generic.rc.
REM

if exist %rc_file% goto skip_rc_file_creation
echo /* Copyright (C) 2016 CA. All rights reserved. */ > %rc_file%
echo #include "application.h" >> %rc_file%
echo #include "%execunit%_buildver.h" >> %rc_file%
echo #include "generic.rc" >> %rc_file%

:skip_rc_file_creation

REM
REM  Extract existing build version 
REM  If file does not yet exist, skip the extraction
REM

if not exist %build_ver_file% goto ver_file_does_not_exist
for /f "tokens=1,2,3 usebackq delims= " %%a in (%build_ver_file%) do (
if "%%b"=="BUILDVERS2" set version_num=%%c
)

REM
REM  Removing any leading 0's from version number (up to 4 times)
REM
if %version_num:~0,1% == 0 set version_num=%version_num:~1%
if %version_num:~0,1% == 0 set version_num=%version_num:~1%
if %version_num:~0,1% == 0 set version_num=%version_num:~1%
if %version_num:~0,1% == 0 set version_num=%version_num:~1%

REM
REM  Skip increment of version is requested
REM
if "%increment_flag%"=="NO" goto skip_increment

:ver_file_does_not_exist
REM
REM  Increment Build version number
REM

set /A version_num+=1

:skip_increment
REM
REM  Pad incremented number with 0's
REM 

set zeros=0000
set version_num=%zeros%%version_num%
set version_num=%version_num:~-5%

REM
REM  Write build versions and timestamp to execunit's buildver file, 
REM  creating new version of the file
REM
REM  If previous version of application.h exists, BUILDVERS and BUILDVERS2
REM  is already present in the file. Handle backward compatibility by
REM  undefining the two #defines before defining them.
REM

echo /* Copyright (C) 2016 CA. All rights reserved. */ > %build_ver_file%
echo #define BUILDTIME    "%TEMP_DATE% %TEMP_TIME%" > %build_ver_file%
%SystemRoot%\system32\find.exe "BUILDVERS" < %application_file% > NUL 2>&1
if %ERRORLEVEL% NEQ 0 goto skip_undefine
echo #ifdef BUILDVERS >> %build_ver_file%
echo #undef BUILDVERS >> %build_ver_file%
echo #endif >> %build_ver_file%
echo #ifdef BUILDVERS2 >> %build_ver_file%
echo #undef BUILDVERS2 >> %build_ver_file%
echo #endif >> %build_ver_file%

:skip_undefine
echo #define BUILDVERS    "%version_num%" >> %build_ver_file%
echo #define BUILDVERS2   %version_num% >> %build_ver_file%

REM
REM  In the case when we are dealing with an older generated GUI RC file,
REM  the include of application.h and {GUI}_buildver.h does not exist.
REM  Therefore, copy generic.rc to the model directory, and add the include
REM  of application.h and {GUI}_buildver.h to the top of the file.
REM
REM  Verify that the GUI RC file does not contain the {GUI}_buildver.h.
REM  If not, create a local copy of generic.rc that does.
REM

if "%rc_type%Z"=="Z" goto xit
%SystemRoot%\system32\find.exe "%execunit%_buildver.h" < %rc_file% > NUL 2>&1
if %ERRORLEVEL% NEQ 1 goto xit

del %generic_rc_file% > NUL 2>&1
echo #include "application.h" >> %generic_rc_file%
echo #include "%execunit%_buildver.h" >> %generic_rc_file%
type %gen_generic_rc_file% >> %generic_rc_file%

:xit
@echo OFF
ENDLOCAL
exit 0
