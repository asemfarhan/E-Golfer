# CA Gen Generated make file for Referential Triggers
# Copyright (C) 2016 CA. All rights reserved.
#
.SUFFIXES:
ENTRYMAINCRTSTARTUP=/entry:_DllMainCRTStartup@12
X86DEF=-D_X86_
DLLNAME=CASCADE
DLLLINK= /OPT:NOREF \
/NOLOGO /NODEFAULTLIB:LIBCMT /DLL /SUBSYSTEM:WINDOWS \
$(ENTRYMAINCRTSTARTUP) /OUT:"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.DLL" \
/implib:"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.LIB" /def:"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.DEF"
PATH=;$(PATH)
LIB=C:\Program Files (x86)\CA\Gen86Free\gen\.\;C:\Program Files (x86)\CA\Gen86Free\gen\;;$(LIB)
INCLUDE=C:\Program Files (x86)\CA\Gen86Free\gen\.\;C:\Program Files (x86)\CA\Gen86Free\gen\;;$(INCLUDE)
PCC=
ALL_DEFS=$(X86DEF) -Dtry=__try -Dexcept=__except -Dleave=__leave -Dfinally=__finally -D_CRT_SECURE_NO_DEPRECATE
ALL_DEF1=-DCRTAPI1=_cdecl -DCRTAPI2=_cdecl -DWIN32 -DMSC -DWINNT -D_MT -D_DLL -DNONTTRACE -DWIN_NT -DREENTRANT
CFLAGS=-c -W3 -Od -nologo $(ALL_DEFS) $(ALL_DEF1)
all: "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.DLL"
# Source Module Dependency
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\E0004080.OBJ": "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0004080.C"
	@"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE "Compiling E0004080"
	@echo.
	@echo ...Compiling E0004080
	@echo echo **************************** > "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo Compile step for C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0004080.C failed with errors. >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo @if exist $@ del $@ >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo **************************** >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	cl $(CFLAGS) -Fo$@ "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0004080.C"
	@if NOT exist $@ exit 1
	@del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
# Source Module Dependency
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\E0001035.OBJ": "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0001035.C"
	@"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE "Compiling E0001035"
	@echo.
	@echo ...Compiling E0001035
	@echo echo **************************** > "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo Compile step for C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0001035.C failed with errors. >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo @if exist $@ del $@ >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo **************************** >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	cl $(CFLAGS) -Fo$@ "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0001035.C"
	@if NOT exist $@ exit 1
	@del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
# Source Module Dependency
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\E0001032.OBJ": "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0001032.C"
	@"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE "Compiling E0001032"
	@echo.
	@echo ...Compiling E0001032
	@echo echo **************************** > "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo Compile step for C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0001032.C failed with errors. >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo @if exist $@ del $@ >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo **************************** >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	cl $(CFLAGS) -Fo$@ "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\E0001032.C"
	@if NOT exist $@ exit 1
	@del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
# Source Module Dependency
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\F0004888.OBJ": "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\F0004888.C"
	@"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE "Compiling F0004888"
	@echo.
	@echo ...Compiling F0004888
	@echo echo **************************** > "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo Compile step for C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\F0004888.C failed with errors. >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo @if exist $@ del $@ >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo **************************** >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	cl $(CFLAGS) -Fo$@ "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\F0004888.C"
	@if NOT exist $@ exit 1
	@del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
# Source Module Dependency
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\F0003820.OBJ": "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\F0003820.C"
	@"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE "Compiling F0003820"
	@echo.
	@echo ...Compiling F0003820
	@echo echo **************************** > "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo Compile step for C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\F0003820.C failed with errors. >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo @if exist $@ del $@ >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo **************************** >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	cl $(CFLAGS) -Fo$@ "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\F0003820.C"
	@if NOT exist $@ exit 1
	@del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
# CASCADE.DLL Dependency
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.DLL":: \
 "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\E0004080.OBJ" \
 "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\E0001035.OBJ" \
 "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\E0001032.OBJ" \
 "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\F0004888.OBJ" \
 "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\OBJC\F0003820.OBJ" \
 "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.RES"

# Generate stub RC file for CASCADE to handle versioning
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.RES"::
	@"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE "Compiling version information"
	@echo.
	@echo ...Compiling CASCADE version information
	@echo echo **************************** > "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo Resource compile for Cascade CASCADE failed with errors. >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo @if exist $@ del $@ >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo **************************** >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	copy "C:\Program Files (x86)\CA\Gen86Free\gen\version\applno.bat" "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\applno.bat"
	@if NOT exist "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\application.h" copy "C:\Program Files (x86)\CA\Gen86Free\gen\version\application.h" "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\application.h"
	call "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\applno.bat" YES "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\" CASCADE
	rc -r -DWIN -DIEF_BITMAP="$(IEF_BITMAP)" -I"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\." -I"C:\Program Files (x86)\CA\Gen86Free\gen\version" -DCUSTOMER_APPL -fo"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.RES" "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.rc"
	@if not exist $@ exit 1
	@del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"

	@echo.
	@echo Compiles for CASCADE DLL Dependencies done.
"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.DLL"::
	@"C:\Program Files (x86)\CA\Gen86Free\gen\instmsgj" CASCADE "Linking CASCADE DLL"
	@echo.
	@echo ...Linking CASCADE DLL
	@echo echo **************************** > "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo Link step using C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.LNK failed with errors. >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo @if exist $@ del $@ >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	@echo echo **************************** >> "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
	link $(DLLLINK) @"C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\CASCADE.LNK"
	@if NOT exist $@ exit 1
	@del "C:\Users\mansour\Documents\CA\Gen 8.6\Models\egolf6.ief\c\ON_ERROR.BAT"
