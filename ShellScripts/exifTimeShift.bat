@echo OFF
rem ############################################################################
rem NAME
rem        exifTimeShift - Shift the photo time taken 
rem
rem SYNTAX
rem        exifTimeShift +/- OFFSET FILE...
rem
rem DESCRIPTION
rem        Pass the arguments to exifTimeSet bash script
rem        in order to update date/time informations.
rem
rem ARGUMENTS
rem        +/-       Operatot    
rem        OFFSET    Shift time value
rem        FILE...   Full image file path names
rem
rem REQUIRED
rem        Windows Subsystem for Linux (WSL) to provide Bash.exe application.
rem
rem        exiftool by Phil Harvey
rem        See: http://www.sno.phy.queensu.ca/~phil/exiftool/
rem
rem DIAGNOSTICS
rem        This application exits with a status of 0 on success, or 1 if
rem        an error occurred processing one or more image files.
rem
rem ----------------------------------------------------------------------------
rem THE BEER-WARE LICENSE
rem <corerd@live.com> wrote this file. As long as you retain this notice you
rem can do whatever you want with this stuff. If we meet some day, and you think
rem this stuff is worth it, you can buy me a beer in return.
rem ----------------------------------------------------------------------------
rem ############################################################################
set BASH_SCRIPT=exifTimeSet

rem Move to the current directory
cd %~dp0

rem Parse parameters in batch files at DOS command line
rem See: https://stackoverflow.com/a/14298769
if "%~1"=="+" goto offset_add
if "%~1"=="-" goto offset_sub
goto exit_syntax_error

:offset_add
set operator=+
goto offset_vslue

:offset_sub
set operator=-
goto offset_vslue

:offset_vslue
shift
if "%~1"=="" goto exit_syntax_error
set "operator=-dt%operator%=%~1"

shift
if "%~1"=="" goto exit_syntax_error

:arg_parse
rem Convert Windows path for Windows Ubuntu Bash
rem Link: https://superuser.com/a/1113866
set "nixFilePath=%~1"

set "drive=%nixFilePath:~0,1%"

set nixFilePath=%nixFilePath:~2%
set "nixFilePath=%nixFilePath:\=/%"

if %drive%==A set "drive=a"
if %drive%==B set "drive=b"
if %drive%==C set "drive=c"
if %drive%==D set "drive=d"
if %drive%==E set "drive=e"
if %drive%==F set "drive=f"
if %drive%==G set "drive=g"
if %drive%==H set "drive=h"
if %drive%==I set "drive=i"
if %drive%==J set "drive=j"
if %drive%==K set "drive=k"
if %drive%==L set "drive=l"
if %drive%==M set "drive=m"
if %drive%==N set "drive=n"
if %drive%==O set "drive=o"
if %drive%==P set "drive=p"
if %drive%==Q set "drive=q"
if %drive%==R set "drive=r"
if %drive%==S set "drive=s"
if %drive%==T set "drive=t"
if %drive%==U set "drive=u"
if %drive%==V set "drive=v"
if %drive%==W set "drive=w"
if %drive%==X set "drive=x"
if %drive%==Y set "drive=y"
if %drive%==Z set "drive=z"

set "nixFilePath=/mnt/%drive%%nixFilePath%"

bash ./%BASH_SCRIPT% %operator% "%nixFilePath%"
if errorlevel 1 goto exit_bash_error

rem next arguments
shift
if "%~1"=="" goto end_arg_parse
goto arg_parse


:end_arg_parse
rem exit with success
pause
exit /B 0


:exit_syntax_error
echo SYNTAX: exifTimeShift +/- OFFSET FILE...
pause
exit /B 1


:exit_bash_error
echo !!! Bash script reports some errors !!!
pause
exit /B 1
