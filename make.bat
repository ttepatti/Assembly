@ECHO OFF
IF "%1"=="" GOTO PrintHelp
IF "%1"=="/?" GOTO PrintHelp
IF "%1"=="/a" GOTO Assemble
IF "%1"=="/l" GOTO Link
IF "%1"=="/al" GOTO DoBoth
:PrintHelp
echo:------------------------------------------------------------------
echo:Make.bat - For Windows x86 ASM
echo:------------------------------------------------------------------
echo:/? - Help
echo:/a - Assemble
echo:     (ml /c /coff /Cp [file.asm])
echo:/l - Link
echo:     (link /SUBSYSTEM:WINDOWS /LIBPATH:c:\masm32\lib [file.obj])
echo:/al - Assemble and Link
echo:      Supply the .asm filename first, then the .obj file
echo:	   Ex: make.bat /al test.asm test.obj
echo:------------------------------------------------------------------
goto end

:PrintError
echo Error - You must supply a file name!
goto end

:Assemble
IF "%2"=="" GOTO PrintError
@ECHO ON
ml /c /coff /Cp %2
@ECHO OFF
echo 
echo Finished Assembling!
goto end

:Link
IF "%2"=="" GOTO PrintError
@ECHO ON
link /SUBSYSTEM:WINDOWS /LIBPATH:c:\masm32\lib %2
@ECHO OFF
echo 
echo Finished Linking!
goto end

:DoBoth
IF "%2"=="" GOTO PrintError
IF "%3"=="" GOTO PrintError
@ECHO ON
ml /c /coff /Cp %2
link /SUBSYSTEM:WINDOWS /LIBPATH:c:\masm32\lib %3
@ECHO OFF
echo 
echo Finished Assembling and Linking!
goto end

:end